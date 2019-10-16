-- Copyright 2019 Google LLC
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

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
