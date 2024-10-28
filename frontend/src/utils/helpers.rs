use chrono::{DateTime, TimeZone, Utc};

pub fn format_timestamp(timestamp: u64) -> String {
    let datetime = DateTime::from_timestamp(timestamp as i64, 0).expect("Invalid timestamp");
    let datetime_utc = Utc.from_utc_datetime(&datetime.naive_utc());
    datetime_utc.format("%Y-%m-%d %H:%M:%S").to_string()
}
