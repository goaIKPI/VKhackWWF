from flask import request
from flask_restplus import Resource

from app.main.service.auth_helper import Auth
from ..util.dto import AuthDto
from ..config import APP_ID, SERVICE_KEY

api = AuthDto.api
user_auth = AuthDto.user_auth
user_vk_auth = AuthDto.user_vk_auth


@api.route('/login')
class UserLogin(Resource):
    """
        User Login Resource
    """
    @api.doc('user login')
    @api.expect(user_auth, validate=True)
    def post(self):
        # get the post data
        post_data = request.json
        return Auth.login_user(data=post_data)


@api.route('/logout')
class LogoutAPI(Resource):
    """
    Logout Resource
    """
    @api.doc('logout a user')
    def post(self):
        # get auth token
        auth_header = request.headers.get('Authorization')
        return Auth.logout_user(data=auth_header)

@api.route('/vkauth')
class LoginVK(Resource):
    @api.doc("log in vk")
    @api.expect(user_vk_auth)
    def post(self):
        body = request.values
        return Auth.vk_login(body['user_id'])

