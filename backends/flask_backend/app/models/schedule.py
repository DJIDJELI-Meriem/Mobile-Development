from .. import db

class Schedule(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    task = db.Column(db.String(100), nullable=False)
    start_time = db.Column(db.String(50), nullable=False)
    end_time = db.Column(db.String(50), nullable=False)
    place = db.Column(db.String(100), nullable=False)