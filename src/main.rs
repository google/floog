// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
