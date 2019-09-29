from app.main import db
from app.main.model.media import Media

def get_url(id):
    media_object = Media.query.filter_by(id=id).first()
    if media_object:
        return media_object.path
    else:
        response_object = {
                    'status': 'fail',
                    'message': 'Some error occurred. Please try again.'
                }
        return response_object