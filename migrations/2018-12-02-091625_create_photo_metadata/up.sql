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
