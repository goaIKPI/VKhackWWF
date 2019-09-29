from app.main import db
from app.main.model.project import Project

def get_a_project(id):
    return Project.query.filter_by(id=id).first()

def get_all_projects():
    return Project.query.all()

def get_projects_by_cat(category):
    return Project.query.filter_by(category=category).all()

def create_project(data):
    project = Project(
        name=data["name"],
        description=data["description"],
        solution_description=data['solution_description'],
        category=data['category'],
        photo_id=data['photo_id'],
        id=data['id'],
        goal=data["goal"],
        collected=data["collected"]
    )
    save_changes(project)


def save_changes(data):
    db.session.add(data)
    db.session.commit()
