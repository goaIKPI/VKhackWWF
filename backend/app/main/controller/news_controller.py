from flask import request
from flask_restplus import Resource

from ..util.dto import NewsDto
from ..service.news_service import get_all_news, get_news_from_org

api = NewsDto.api
_news = NewsDto.news

@api.route('/')
class NewsList(Resource):
    @api.doc('list_of_all news')
    @api.marshal_list_with(_news, envelope='data')
    def get(self):
        """List all news"""
        return get_all_news()

@api.route('/<organization_id>')
@api.param('organization_id', 'org id')
@api.response(404, 'Organizaton not found')
class NewsByOrganization(Resource):
    @api.doc('list of all news from given organization')
    @api.marshal_with(_news)
    def get(self, organization_id):
        """list of all news from given organization"""
        org = get_news_from_org(organization_id)
        if not org:
            api.abort(404)
        else:
            return org