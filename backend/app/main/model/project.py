from .. import db

class Project(db.Model):
    """ Project Model for storing details about project """
    __tablename__ = "project"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(250))
    description = db.Column(db.String(1000))
    solution_description = db.Column(db.String(3000))
    organization = db.Column(db.Integer, db.ForeignKey('organization.id'), nullable=True, default=1)
    donations = db.relationship('Donation', backref="project")
    goal = db.Column(db.Float)
    collected = db.Column(db.Float)
    category = db.Column(db.String(20))
    photo_id = db.Column(db.Integer, db.ForeignKey('media.id'), nullable=True, default=1)