from flask import request
from flask_restplus import Resource

from ..util.dto import OrganizationDto
from ..service.organizations_service import get_all_organizations, get_organization

api = OrganizationDto.api
_organization = OrganizationDto.organization

@api.route('/')
class Organization(Resource):
    @api.doc('gets all organizations')
    @api.marshal_list_with(_organization)
    def get(self):
        return get_all_organizations()

@api.route('/<id>')
@api.param('id', 'id in db')
class OrganizationById(Resource):
    @api.doc("get org by id")
    @api.marshal_with(_organization)
    def get(self, id):
        org = get_organization(id)
        if not org:
            api.abort(404)
        else:
            return org