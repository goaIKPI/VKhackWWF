from flask import request
from flask_restplus import Resource

from app.main.util.decorator import admin_token_required
from ..util.dto import UserDto
from ..service.user_service import save_new_user, get_all_users, get_a_user, get_fav_categories, add_category,\
    generate_scoreboard


api = UserDto.api
_user = UserDto.user
_fav = UserDto.favorite_category


@api.route('/')
class UserList(Resource):
    @api.doc('list_of_registered_users')
    @api.marshal_list_with(_user, envelope='data')
    def get(self):
        """List all registered users"""
        return get_all_users()



@api.route('/<vk_id>')
@api.param('vk_id', 'The User identifier')
@api.response(404, 'User not found.')
class User(Resource):
    @api.doc('get a user')
    @api.marshal_list_with(_user)
    def get(self, vk_id):
        """get a user given its identifier"""
        user = get_a_user(vk_id)
        print(user)
        if not user:
            api.abort(404)
        else:
            return user


@api.route('/favorites/<vk_id>')
@api.param('vk_id', 'The User identifier')
class UserFavorites(Resource):
    @api.doc('gets user fav categories')
    @api.marshal_with(_fav)
    def get(self, vk_id):
        """gets user fav categories"""
        fav = get_fav_categories(vk_id)
        if not fav:
            api.abort(404)
        else:
            return fav

    @api.expect(_fav)
    @api.doc('add category')
    def post(self, vk_id):
        data = request.args
        add_category(vk_id, data["category"])
        return {"status":"success", "message":"category added"}

@api.route('/scoreboard')
class Scoreboard(Resource):
    @api.doc('gets scoreboard')
    @api.marshal_with(_user)
    def get(self):
        """gets scoreboard"""
        scoreboard = generate_scoreboard()
        if not scoreboard:
            api.abort(404)
        else:
            return scoreboard



