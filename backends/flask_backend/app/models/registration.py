from .. import db

class Registration(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(20), nullable=False)
    age = db.Column(db.String(10), nullable=False)
    hackathon_experience = db.Column(db.Text, nullable=False)
    skills = db.Column(db.Text, nullable=False)
    goal = db.Column(db.Text, nullable=False)
    motivation = db.Column(db.Text, nullable=False)
    education = db.Column(db.Text, nullable=False)
    organization = db.Column(db.Text, nullable=False)