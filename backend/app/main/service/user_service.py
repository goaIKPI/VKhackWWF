import uuid
import datetime

from app.main import db, vk
from app.main.model.user import User
from app.main.model.favorites import Favorites
from app.main.model.donation import Donation

def get_fav_categories(user_id):
    return Favorites.query.filter_by(user_id=user_id).all()

def add_category(user_id, category):
    favs = Favorites(
        user_id=user_id,
        category = category
    )
    save_changes(favs)

def get_user_name(vk_id):
    user = vk.users.get(user_ids=vk_id)[0]
    return user['first_name'] + " " + user["last_name"]

def get_rating(vk_id):
    rating = 0
    donations = Donation.query.filter_by(from_user_id=vk_id).all()
    for d in donations:
        rating += d.amount
    return rating



def save_new_user(data):
    user = vk.users.get(user_ids=data["vk_id"], fields="photo_100")[0]
    print(user)
    photo_path = user["photo_100"]
    print(photo_path)
    new_user = User(
        vk_id=data['vk_id'],
        profile_pic_path = photo_path,
        registered_on=datetime.datetime.utcnow()
    )
    save_changes(new_user)


def get_all_users():
    return User.query.all()

def generate_scoreboard():
    scoreboard = []
    users = get_all_users()
    for user in users:
        scoreboard.append(get_a_user(user.vk_id))

    return sorted(scoreboard, key=lambda x: x["rating"], reverse=True)

def get_a_user(vk_id):
    user_name = get_user_name(vk_id)
    rating = get_rating(vk_id)
    user = dict(User.query.filter_by(vk_id=int(vk_id)).first().__dict__)
    user.pop('_sa_instance_state', None)
    user["username"] = user_name
    user["rating"] = rating
    return user


# def generate_token(user):
#     try:
#         # generate the auth token
#         auth_token = User.encode_auth_token(user.id)
#         response_object = {
#             'status': 'success',
#             'message': 'Successfully registered.',
#             'Authorization': auth_token.decode()
#         }
#         return response_object, 201
#     except Exception as e:
#         response_object = {
#             'status': 'fail',
#             'message': 'Some error occurred. Please try again.'
#         }
#         return response_object, 401


def save_changes(data):
    db.session.add(data)
    db.session.commit()

