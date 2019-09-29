from flask import request
from flask_restplus import Resource

from app.main.util.decorator import token_required
from ..util.dto import DonationDto
from ..service.project_service import get_a_project, get_all_projects, get_projects_by_cat