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
