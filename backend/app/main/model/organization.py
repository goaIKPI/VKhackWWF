from .. import db

class Organization(db.Model):
    """model for organization data"""
    __tablename__ = "organization"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    photo_id = db.Column(db.Integer, db.ForeignKey('media.id'), nullable=True, default=1)
    name = db.Column(db.String(250))
    short_description = db.Column(db.String(1000))
    description = db.Column(db.String(3000))
    info_phones = db.Column(db.String(100)) #can be \n separated
    info_website = db.Column(db.String(255))
    info_address = db.Column(db.String(255))

