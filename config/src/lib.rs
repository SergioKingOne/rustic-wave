use lazy_static::lazy_static;
use std::env;

#[derive(Debug, Clone)]
pub struct Config {
    pub aws_access_key_id: String,
    pub aws_secret_access_key: String,
}

impl Config {
    pub fn from_env() -> Result<Self, env::VarError> {
        Ok(Config {
            aws_access_key_id: env::var("AWS_ACCESS_KEY_ID")?,
            aws_secret_access_key: env::var("AWS_SECRET_ACCESS_KEY")?,
        })
    }
}

// Initialize a global instance of Config with lazy_static
lazy_static! {
    pub static ref CONFIG: Config = Config::from_env().expect("Failed to load configuration");
}
