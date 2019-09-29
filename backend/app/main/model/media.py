from .. import db


class Media(db.Model):
    """ Model for storing media for projects and users """
    __tablename__ = "media"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type = db.Column(db.String(10))
    path = db.Column(db.String(250))
    parent = db.relationship('Project', backref="media")