use std::env;
use std::eprintln;
use std::process;

fn main() {
    env_logger::init();

    let urls = env::args().skip(1).collect::<Vec<_>>();

    if urls.is_empty() {
        eprintln!("Usage: get-images URL ...");
        process::exit(1);
    }

    if let Err(err) = get_images::run(urls) {
        eprintln!("Application error: {err:?}");
        process::exit(1);
    }
}
