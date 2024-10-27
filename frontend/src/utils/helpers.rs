pub fn format_date(timestamp: u64) -> String {
    use chrono::{NaiveDateTime, Utc};
    let naive = NaiveDateTime::from_timestamp(timestamp as i64, 0);
    let datetime = chrono::DateTime::<Utc>::from_utc(naive, Utc);
    datetime.format("%Y-%m-%d %H:%M:%S").to_string()
}
