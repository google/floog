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
