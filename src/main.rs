extern crate zip;

use std::fs;

fn main() {
    println!("Hello, world!");
    let args: Vec<_> = std::env::args().collect();
    if args.len() < 2 {
        println!("Usage: {} <filename>", args[0]);
        return;
    }

    let fname = std::path::Path::new(&*args[1]);
    let file = fs::File::open(&fname).unwrap();

    let mut archive = zip::ZipArchive::new(file).unwrap();
    for i in 0..archive.len() {
        let mut file = archive.by_index(i);
        print_file(file);
    }
}

fn print_file<'a>(
    in_file: zip::result::ZipResult<zip::read::ZipFile>,
) -> zip::result::ZipResult<()> {
    let file = in_file?;
    println!("read file: {:?}", file.sanitized_name());
    return Ok(());
}
