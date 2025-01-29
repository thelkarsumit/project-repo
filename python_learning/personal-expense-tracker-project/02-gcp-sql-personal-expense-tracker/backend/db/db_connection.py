from flask_sqlalchemy import SQLAlchemy
from config import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

db = SQLAlchemy()

def init_db(app):
    app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
    db.init_app(app)
