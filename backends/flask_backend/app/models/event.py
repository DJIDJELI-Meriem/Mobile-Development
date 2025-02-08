from .. import db

class Event(db.Model):
    __tablename__ = 'Hackthon'
    id = db.Column(db.Integer, primary_key=True)
    field = db.Column(db.String(100), nullable=False)
    topic = db.Column(db.String(100), nullable=False)
    place = db.Column(db.String(100), nullable=False)
    start_date = db.Column(db.String(50), nullable=False)
    end_date = db.Column(db.String(50), nullable=False)
    price = db.Column(db.String(50), nullable=False)
    first_prize = db.Column(db.String(50), nullable=False)
    second_prize = db.Column(db.String(50), nullable=False)
    third_prize = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text, nullable=False)
    sponsors = db.Column(db.Text, nullable=False)
    creators = db.Column(db.Text, nullable=False)
    hackathon_name = db.Column(db.Text, nullable=False)