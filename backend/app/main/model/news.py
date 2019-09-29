from .. import db

class News(db.Model):
    """"""
    __tablename__ = "news"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'))
    organization_id = db.Column(db.Integer, db.ForeignKey('organization.id'))
    photo_id = db.Column(db.Integer, db.ForeignKey('media.id'), nullable=True, default=1)
    name = db.Column(db.String(250))
    short_description = db.Column(db.String(250))
    description = db.Column(db.String(500))

