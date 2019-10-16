# Photo Dump Uploader

This is a tool to upload exported Flickr data (as produced by the "Your Flickr
Data" option on https://www.flickr.com/account) to Google Photos, preserving the
album membership.

## Design

It reads the archive metadata and stores it in a SQLite database. After
importing everything, it then uploads the photos to Google using the Google
Photos API. It does not modify the archives at all, and only adds the metadata
to the SQLite database, so the local data that it writes is quite small.

## Limitations

The Google Photos API is very limited in what can be uploaded, so there is not a
1:1 conversion. In particular, there is no nesting of albums as there is in
Flickr collections, so the structure of any collections is lost. Also, Google
Photos has no concept of photo tags either.

## Disclaimer

This is not an officially supported Google product.
