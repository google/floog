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

-- A Flickr Photo album. Contains only info about the album itself. The photos
-- included in the album are in the separate 'album_photos' table.
CREATE TABLE albums (
  -- Opaque ID. Alias to the SQLite rowid.
  id INTEGER PRIMARY KEY,

  -- Metadata file which contains the info for this album.
  file_id INTEGER NOT NULL,


  -- The expected number of photos in the album, according to the JSON.
  photo_count INTEGER NOT NULL,

  -- The Flickr ID of this album
  flickr_id INTEGER NOT NULL UNIQUE,

  -- The title of the album. It may be able to be an empty string, but it is
  -- never NULL.
  title TEXT NOT NULL,

  -- Description of the album. May be an empty string, but is never NULL.
  description TEXT NOT NULL,

  -- The time at which the album was created.
  created_time DATETIME NOT NULL,

  -- The time at which the album was last updated.
  last_updated_time DATETIME NOT NULL,

  -- The URL of the cover photo. This might be the URL of a photo within the
  -- album, but I'm not sure. Don't rely on that.
  cover_photo_url TEXT,

  -- The order in which the album appears in the file, counting from zero.
  sequence_num INTEGER NOT NULL,

  FOREIGN KEY(file_id) REFERENCES files(id)
)
