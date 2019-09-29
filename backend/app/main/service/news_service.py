from app.main import db, vk
from app.main.model.news import News

def get_all_news():
    return News.query.all()

def get_news_from_org(org_id):
    return News.query.filter_by(organization_id=org_id).all()