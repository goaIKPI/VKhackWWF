from flask_restplus import Api
from flask import Blueprint


from .main.controller.user_controller import api as user_ns
from .main.controller.auth_controller import api as auth_ns
from .main.controller.project_controller import api as project_ns
from .main.controller.media_controller import api as media_ns
from .main.controller.organization_controller import api as organization_ns
from .main.controller.news_controller import api as news_ns



blueprint = Blueprint('api', __name__)

api = Api(blueprint,
          title='FLASK RESTPLUS API BOILER-PLATE WITH JWT',
          version='1.0',
          description='a boilerplate for flask restplus web service'
          )

api.add_namespace(user_ns, path='/user')
api.add_namespace(auth_ns)
api.add_namespace(project_ns, path='/project')
api.add_namespace(media_ns, path='/media')
api.add_namespace(organization_ns, path='/organization')
api.add_namespace(news_ns, path='/news')