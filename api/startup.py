from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import config

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = config.DB_URI
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["CORS_SUPPORTS_CREDENTIALS"] = True
app.config['TEMPLATES_AUTO_RELOAD'] = True

# TODO: restrict cors policies to actual domains
CORS(app)

db = SQLAlchemy(app)
