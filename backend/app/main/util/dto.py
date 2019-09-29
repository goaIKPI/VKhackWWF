from flask_restplus import Namespace, fields

class ProjectDto:
    api = Namespace('project', description='project related operations')
    project = api.model('project', {
        'name': fields.String(required=False, description="a header for the project"),
        'description': fields.String(required=False, description="a description for the project"),
        'solution_description': fields.String(required=False, description="a description of solution for the project"),
        'category': fields.String(required=False, description="category of project"),
        'photo_id': fields.Integer(required=False, description="the main photo for the project"),
        'id': fields.Integer(requred=False, description="id in the db"),
        "goal": fields.Float(required=False, description="goal"),
        "collected": fields.Float(required=False, description='collected')

    })

class MediaDto:
    api = Namespace('media', description='media related operations')
    media = api.model('media', {
        'id': fields.String(required=True, description='id in the db'),
        'type': fields.String(required=False, description="type of mediafile"),
        'path': fields.String(required=False, description='path to the file on filesystem')

    })

class OrganizationDto:
    api = Namespace('organization', description='organization related operations')
    organization = api.model('organization', {
        'id': fields.String(required=True, description='id in the db'),
        'photo_id': fields.Integer(requred=False, description='photo_id in db'),
        'name': fields.String(requred=False, description='name of the organization'),
        'short_description':fields.String(requred=False, description="short description which is shown first"),
        'description':fields.String(requred=False, description="description which is shown in org card"),
        'info_phones': fields.String(required=False, description="contact phones. can be \\n separated"),
        'info_website': fields.String(required=False, description='website of the org'),
        'info_address': fields.String(required=False, description='address of the org')

    })



class UserDto:
    api = Namespace('user', description='user related operations')
    user = api.model('user', {
        "registered_on": fields.DateTime(description="registered on"),
        "vk_id": fields.String(description='vk id'),
        "username": fields.String(description='user`s name'),
        'rating': fields.Integer(description="user's rating"),
        "profile_pic_path": fields.String(description="a link to small user's profile pic")

    })
    favorite_category = api.model('favorite', {
        'id': fields.Integer(description="id in db"),
        'user_id': fields.Integer(description="user's vk id"),
        'category': fields.String(description='fav category')
    })



class AuthDto:
    api = Namespace('auth', description='authentication related operations')
    user_auth = api.model('auth_details', {
        'email': fields.String(required=True, description='The email address'),
        'password': fields.String(required=True, description='The user password '),
    })
    user_vk_auth = api.model('vk_auth_details', {
        'user_id': fields.String(required=True, description='User vk id ')
    })


class NewsDto:
    api = Namespace('news', description='News related operations')
    news = api.model('news', {
        'id': fields.String(required=True, description='id in the db'),
        'photo_id': fields.Integer(requred=False, description='photo_id in db'),
        'name': fields.String(requred=False, description='name of the organization'),
        'short_description': fields.String(requred=False, description="short description which is shown first"),
        'description': fields.String(requred=False, description="description which is shown in org card"),
        "organization_id": fields.Integer(required=False, description="id of the parent organization"),
        "project_id": fields.Integer(required=False, description="id of the project organization")

    })