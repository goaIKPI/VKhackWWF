from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
import vk_api

from .config import config_by_name, SECURE_KEY, SERVICE_KEY, APP_ID

vk_session = vk_api.VkApi(token=SERVICE_KEY, app_id=APP_ID, client_secret=SECURE_KEY)
vk = vk_session.get_api()
db = SQLAlchemy()
flask_bcrypt = Bcrypt()


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config_by_name[config_name])
    db.init_app(app)
    flask_bcrypt.init_app(app)

    return app