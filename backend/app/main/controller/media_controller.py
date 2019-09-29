from flask import request, send_from_directory, send_file
from flask_restplus import Resource

from app.main.util.decorator import token_required
from ..util.dto import MediaDto
from ..service.media_service import get_url
from ..config import STATIC_PATH

api = MediaDto.api
_media = MediaDto.media

@api.route('/<media_id>')
@api.param('media_id', 'id in the db')
@api.response('404', "Media object not found")
class Media(Resource):
    @api.doc('get the media file`s url')
    #@api.marshal_with(_media)
    @api.produces(["image/jpeg", "image/png"])
    def get(self, media_id):
        url = get_url(media_id)
        if not url:
            api.abort(404)
        else:
            # print(STATIC_PATH, url)
            # import os
            # dirpath = os.getcwd()
            # print("current directory is : " + dirpath)
            return send_file(STATIC_PATH+url)
