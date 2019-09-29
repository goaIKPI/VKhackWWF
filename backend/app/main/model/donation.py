from .. import db

class Donation(db.Model):
    """ Donation Model for storing donations """
    __tablename__ = "donation"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    from_user_id = db.Column(db.Integer, db.ForeignKey('user.vk_id'), nullable=False)
    to_project_id = db.Column(db.Integer, db.ForeignKey('project.id'), nullable=False)
    is_subscription = db.Column(db.Boolean, nullable=False, default=False)
    interval = db.Column(db.DateTime, nullable=False)
    amount = db.Column(db.Float)
    currency = db.Column(db.String(10))