-- Photo metadata imported from a photo_ID.json file in an archive.
CREATE TABLE photo_metadata (
  -- Opaque ID. Alias to the SQLite rowid.
  id INTEGER PRIMARY KEY,

  -- Metadata file which contains the info for this photo JSON file. Each photo
  -- file contains metadata for only one photo, so this field is unique.
  file_id INTEGER NOT NULL UNIQUE,

  -- Flickr ID of the photo.
  flickr_id INTEGER NOT NULL UNIQUE,

  -- Name of the photo. May be the empty string, but is never NULL.
  name TEXT NOT NULL,

  -- Description of the photo. May be the empty string, but is never NULL.
  description TEXT NOT NULL,

  -- Time the photo was taken.
  taken_time DATETIME,

  -- Time the photo was uploaded to Flickr.
  imported_time DATETIME,

  -- The privacy value of the photo. An enum with the value "Public", "Private",
  -- or "Friends".
  privacy TEXT,

  FOREIGN KEY(file_id) REFERENCES files(id)
)
