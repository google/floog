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

joinable!(files -> archives (archive_id));

allow_tables_to_appear_in_same_query!(
    archives,
    files,
);
