use crate::Result;

use std::collections::HashMap;
use std::ffi::OsStr;
use std::fmt::Display;
use std::path::Path;
use std::sync::atomic::{AtomicUsize, Ordering};

use lol_html::{element, rewrite_str, RewriteStrSettings};
use url::Url;

#[derive(Debug)]
pub struct Image {
    url: Url,
    path: String,
}

impl Image {
    fn build<F>(img_src: &str, fmt: F) -> Result<Image>
    where
        F: FnOnce(&str) -> String,
    {
        let mut url = Url::parse(img_src).map_err(|e| format!("{e}: {img_src}"))?;

        if !url.has_host() {
            Err(format!("URL has no host: {img_src}"))?;
        }

        url.set_query(None);

        let path = Path::new(url.path())
            .file_name()
            .and_then(OsStr::to_str)
            .ok_or_else(|| format!("cannot get image path from {url}"))?;

        let path = fmt(path);

        Ok(Image { url, path })
    }

    pub fn write<F>(&self, get: F) -> Result<()>
    where
        F: FnOnce(&str) -> Result<Vec<u8>>,
    {
        let bytes = get(self.url.as_str())?;

        image::load_from_memory(&bytes)?.save(&self.path)?;

        Ok(())
    }
}

pub fn collect_images(html: &str, prefix: impl Display + Copy) -> Vec<Result<Image>> {
    let mut images = HashMap::new();

    let element_content_handlers = vec![element!("img", |el| {
        let Some(img_src) = el.get_attribute("src").or(el.get_attribute("data-src")) else {
            log::debug!("could not get img[src] of: {el:?}");

            return Ok(());
        };

        images.entry(img_src).or_insert_with_key(|k| {
            Image::build(k, |path| format!("{prefix}-{id}-{path}", id = get_id()))
        });

        Ok(())
    })];

    rewrite_str(
        html,
        RewriteStrSettings {
            element_content_handlers,
            ..RewriteStrSettings::default()
        },
    )
    .expect("error collecting images");

    images.into_values().collect()
}

static COUNTER: AtomicUsize = AtomicUsize::new(1);

fn get_id() -> usize {
    COUNTER.fetch_add(1, Ordering::Relaxed)
}
