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
