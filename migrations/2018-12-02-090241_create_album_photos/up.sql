-- Mapping between albums and photos.
CREATE TABLE album_photos (
  -- Row ID, needed by Diesel.
  id INTEGER PRIMARY KEY,

  -- The album ID of this mapping
  album_id INTEGER NOT NULL,

  -- The Flickr ID of the photo.
  photo_flickr_id INTEGER NOT NULL,

  -- The order in which the photo appears in the album.
  sequence_num INTEGER NOT NULL,

  FOREIGN KEY(album_id) REFERENCES albums(id)
)
