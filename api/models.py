from startup import db
from sqlalchemy import BOOLEAN, ForeignKey
from sqlalchemy.orm import RelationshipProperty
from sqlalchemy.dialects.mysql import INTEGER, BIGINT, VARCHAR, CHAR


class User(db.Model):
    id = db.Column(INTEGER, primary_key=True, autoincrement=True)
    admin = db.Column(BOOLEAN)
    username = db.Column(VARCHAR(128), unique=True)
    email = db.Column(VARCHAR(128), unique=True)
    password_hash = db.Column(CHAR(64), nullable=True)
    password_salt = db.Column(CHAR(64), nullable=True)
    register_date = db.Column(BIGINT, nullable=False)
    first_name = db.Column(VARCHAR(128), nullable=False)
    last_name = db.Column(VARCHAR(128), nullable=False)
    born_date = db.Column(BIGINT, nullable=False)
    password_reset_token = db.Column(CHAR(64), nullable=True)
    email_verification_token = db.Column(CHAR(64), nullable=True)


class Category(db.Model):
    id = db.Column(INTEGER, primary_key=True, autoincrement=True)
    category = db.Column(VARCHAR(45))


class Todo(db.Model):
    id = db.Column(INTEGER, primary_key=True, autoincrement=True)
    user_id = db.Column(INTEGER, ForeignKey(User.id), nullable=False)
    user: User = RelationshipProperty(User, foreign_keys=[user_id])
    category_id = db.Column(INTEGER, ForeignKey(Category.id), nullable=False)
    category: Category = RelationshipProperty(Category, foreign_keys=[category_id])
    creation_date = db.Column(BIGINT, nullable=True)
    end_date = db.Column(BIGINT, nullable=True)
    todo = db.Column(VARCHAR(256))
    done = db.Column(BOOLEAN)
    important = db.Column(BOOLEAN)
    deadline = db.Column(BIGINT, nullable=False)


class Session(db.Model):
    id = db.Column(INTEGER, primary_key=True, autoincrement=True)
    user_id = db.Column(INTEGER, ForeignKey(User.id), nullable=False)
    user: User = RelationshipProperty(User, foreign_keys=[user_id])
    token_hash = db.Column(CHAR(64), nullable=False)
