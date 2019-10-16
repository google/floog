// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

table! {
    album_photos (id) {
        id -> Nullable<Integer>,
        album_id -> Integer,
        photo_flickr_id -> Integer,
        sequence_num -> Integer,
    }
}

table! {
    albums (id) {
        id -> Nullable<Integer>,
        file_id -> Integer,
        photo_count -> Integer,
        flickr_id -> Integer,
        title -> Text,
        description -> Text,
        created_time -> Timestamp,
        last_updated_time -> Timestamp,
        cover_photo_url -> Nullable<Text>,
        sequence_num -> Integer,
    }
}

table! {
    archives (id) {
        id -> Nullable<Integer>,
        filename -> Text,
        hash -> Text,
        modified_time -> Timestamp,
        archive_type -> Text,
        sequence_num -> Integer,
    }
}

table! {
    files (id) {
        id -> Nullable<Integer>,
        archive_id -> Nullable<Integer>,
        filename -> Text,
        hash -> Text,
        modified_time -> Timestamp,
        file_type -> Text,
        sequence_num -> Integer,
    }
}

table! {
    photo_data (id) {
        id -> Nullable<Integer>,
        file_id -> Integer,
        flickr_photo_id -> Text,
    }
}

table! {
    photo_metadata (id) {
        id -> Nullable<Integer>,
        file_id -> Integer,
        flickr_id -> Integer,
        name -> Text,
        description -> Text,
        taken_time -> Nullable<Timestamp>,
        imported_time -> Nullable<Timestamp>,
        privacy -> Nullable<Text>,
    }
}

joinable!(album_photos -> albums (album_id));
joinable!(albums -> files (file_id));
joinable!(files -> archives (archive_id));
joinable!(photo_data -> files (file_id));
joinable!(photo_metadata -> files (file_id));

allow_tables_to_appear_in_same_query!(
    album_photos,
    albums,
    archives,
    files,
    photo_data,
    photo_metadata,
);
