from flask import request
from flask_restplus import Resource

from app.main.util.decorator import token_required
from ..util.dto import ProjectDto
from ..service.project_service import get_a_project, get_all_projects, get_projects_by_cat, create_project

api = ProjectDto.api
_project = ProjectDto.project

@api.route('/')
class ProjectList(Resource):
    @api.doc('Lists all projects')
    @api.marshal_list_with(_project, envelope='data')
    def get(self):
        """Lists all projects"""
        return get_all_projects()


    @api.doc('creates project')
    @api.expect(_project, validate=True)
    def post(self):
        data = request.json
        create_project(data)
        return {"status":"success", "message":"project created"}


@api.route('/<category>')
@api.param("category", "The category of projects")
@api.response('404', "Projects not found")
class ProjectByCat(Resource):
    @api.doc('get projects by category')
    @api.marshal_list_with(_project)
    def get(self, category):
        '''gets projects from category'''
        projects = get_projects_by_cat(category)
        if not projects:
            api.abort(404)
        else:
            return projects


