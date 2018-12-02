-- A photo data file, containing the actual bytes of the photo. The data itself
-- is not imported.
CREATE TABLE photo_data (
  -- Opaque ID. Alias to the SQLite rowid.
  id INTEGER PRIMARY KEY,

  -- Reference to the file containing this photo data.
  file_id INTEGER NOT NULL UNIQUE,

  -- Flickr ID of the photo.
  flickr_photo_id TEXT NOT NULL UNIQUE,

  FOREIGN KEY(file_id) REFERENCES files(id)
)
