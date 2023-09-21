mod image;

use std::cmp::min;
use std::io::Read;
use std::time::Duration;

use rayon::prelude::*;

type Result<T> = std::result::Result<T, Box<dyn std::error::Error + Send + Sync + 'static>>;

// For single thread mode set this variable on your command line:
// export RAYON_NUM_THREADS=1

pub fn run(urls: Vec<String>) -> Result<()> {
    let agent = ureq::builder().build();

    let htmls = urls
        .into_par_iter()
        .map(|url| agent.get(&url).call().unwrap().into_string().unwrap())
        .collect::<Vec<_>>();

    let (images, errors): (Vec<_>, Vec<_>) = htmls
        .iter()
        .enumerate()
        .flat_map(|(i, h)| image::collect_images(h, i))
        .partition(Result::is_ok);

    let images: Vec<_> = images.into_iter().map(Result::unwrap).collect();
    let errors: Vec<_> = errors.into_iter().map(Result::unwrap_err).collect();

    if !errors.is_empty() {
        log::info!("Errors while collecting images: {:?}", errors);
    }

    let (success, errors): (Vec<_>, Vec<_>) = images
        .into_par_iter()
        .map(|image| {
            image.write(|url| {
                const MAX_SIZE: usize = 10e6 as _;

                log::debug!("downloading {url}");

                let res = agent.get(url).timeout(Duration::from_secs(30)).call()?;

                if res.status() != 200 {
                    Err(format!(
                        "{code}: {text}",
                        code = res.status(),
                        text = res.status_text()
                    ))?;
                }

                let len = res
                    .header("Content-Length")
                    .and_then(|s| s.parse().ok())
                    .unwrap_or_default();

                let mut bytes = Vec::with_capacity(min(len, MAX_SIZE));

                res.into_reader()
                    .take(MAX_SIZE as _)
                    .read_to_end(&mut bytes)?;

                Ok(bytes)
            })
        })
        .partition(Result::is_ok);

    if !errors.is_empty() {
        log::info!("Errors while downloading images: {errors:?}");
    }

    log::info!("success: {}, failure: {}", success.len(), errors.len());

    Ok(())
}
