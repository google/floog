-- Create non-unique index on album.
CREATE INDEX IF NOT EXISTS album_photos_album_idx ON
  album_photos (album_id)
