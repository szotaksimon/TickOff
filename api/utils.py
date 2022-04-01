from secrets import token_hex
from hashlib import sha256
from models import User, Session
from flask import request, abort
from threading import Thread
import config
from time import time


def utc_now():
    return int(time())


def utc_today():
    now = utc_now()
    start = now - now % 86400
    end = start + 86400
    return start, end


def utc_week():
    day_start, day_end = utc_today()
    return day_start - 6 * 86400, day_end


def check_password(password: str, user: User):
    return salted_hash(password, user.password_salt) == user.password_hash


def hash(input: str):
    return sha256(input.encode("UTF-8")).hexdigest()


def salted_hash(input: str, salt: str):
    return hash(input + salt)


def random_token():
    return token_hex(32)


def random_password():
    return token_hex(8)


def validate_json(*keys) -> "tuple":
    json = request.get_json()

    if json is None or any([key not in json for key in keys]):
        abort(400, "invalid body format")

    return (json[key] for key in keys)


def auth_session(auto_abort=True) -> "tuple[Session, User]":
    token = request.cookies.get(config.SESSION_COOKIE_KEY)

    # no cookie present
    if token is None:
        if auto_abort:
            abort(401)
        else:
            return None, None

    token_hash = hash(token + config.SESSION_KEY_SALT)
    session: Session = Session.query.filter_by(token_hash=token_hash).first()

    # invalid session token
    if session is None:
        abort(401)

    # valid session token
    return session, session.user


def validate_json(*keys, json=None) -> "tuple":
    if json is None:
        json = request.get_json()

    if json is None or any([key not in json for key in keys]):
        abort(400, "invalid body format")

    return (json[key] for key in keys)
