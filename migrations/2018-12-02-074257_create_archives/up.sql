CREATE TABLE archives (
  -- Opaque ID. Alias to the SQLite rowid.
  id INTEGER PRIMARY KEY,

  -- Filename. No directories are stored, only the filename itself.
  filename TEXT NOT NULL,

  -- SHA256 hash of the data, stored as a hex string.
  hash TEXT NOT NULL,

  -- The date at which the archive was last modified, according to the
  -- filesystem.
  modified_time DATETIME NOT NULL,

  -- The type of the archive. One of "Metadata" or "PhotoData".
  archive_type TEXT NOT NULL,

  -- The sequence number of this archive. Metadata archives appear to be able to
  -- have more than one part, and the photo data can be spread across many
  -- archives.
  sequence_num INTEGER NOT NULL
)
