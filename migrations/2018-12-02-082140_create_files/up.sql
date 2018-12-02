-- A file (either JSON or photo data) contained in an archive.
CREATE TABLE files (
  -- Opaque ID. Alias to the SQLite rowid.
  id INTEGER PRIMARY KEY,

  -- Archive which contains this file.
  archive_id INTEGER,

  -- Filename within the archive.
  filename TEXT NOT NULL,

  -- SHA256 hash of the data, stored as a hex string.
  hash TEXT NOT NULL,

  -- The date at which the file was last modified, according to the
  -- archive.
  modified_time DATETIME NOT NULL,

  -- The type of the file. One of "AlbumMeta", "PhotoMeta", or "PhotoData".
  file_type TEXT NOT NULL,

  -- The order in which this file appears within the archive.
  sequence_num INTEGER NOT NULL,

  FOREIGN KEY(archive_id) REFERENCES archives(id)
)
