# Flickr2Goog

This is a tool to take exported Flickr data, as produced by the "Your Flickr
Data" option on https://www.flickr.com/account . It will upload photos to Google
Photos and preserve the album membership of the photos.

## Design

It reads the archive metadata and stores it in a SQLite database. After
importing everything, it then uploads the photos to Google using the Google
Photos API. It does not modify the archives at all, and only adds the metadata
to the SQLite database, so the local data that it writes is quite small.

## Limitations

The Google Photos API is very limited in what can be uploaded, so there is not a
1:1 conversion. In particular, the API [only allows one album per
photo](https://issuetracker.google.com/issues/109505022), so if a photo exists
in two or more albums, it will only be added to one album.
