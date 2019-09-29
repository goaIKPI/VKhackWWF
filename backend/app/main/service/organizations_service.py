from app.main import db
from app.main.model.organization import Organization

def get_all_organizations():
    return Organization.query.all()

def get_organization(org_id):
    return Organization.query.filter_by(id=org_id).first()