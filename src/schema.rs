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

joinable!(albums -> files (file_id));
joinable!(files -> archives (archive_id));

allow_tables_to_appear_in_same_query!(
    albums,
    archives,
    files,
);
