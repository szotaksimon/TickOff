from os import getenv

def get_env_variable(key: str, default=None):
    value = getenv(key, default)
    if value is None:
        print(f".env is missing key: {key}")
        exit()
    return value

MAILGUN_API_URL = get_env_variable("MAILGUN_API_URL")
DB_URI = get_env_variable("DB_URI")
SESSION_COOKIE_KEY = get_env_variable("SESSION_COOKIE_KEY")
SESSION_KEY_SALT = get_env_variable("SESSION_KEY_SALT")
MAILGUN_API_KEY = get_env_variable("MAILGUN_API_KEY")
APP_URL = get_env_variable("APP_URL")
API_URL = get_env_variable("API_URL")