from flask import Blueprint, request, jsonify
from ..models.registration import Registration
from .. import db

bp = Blueprint('registrations', __name__)

@bp.route('/registrations', methods=['POST'])
def submit_registration():
    data = request.get_json()
    new_registration = Registration(
        name=data['name'],
        email=data['email'],
        phone=data['phone'],
        age=data['age'],
        hackathon_experience=data['hackathon_experience'],
        skills=data['skills'],
        goal=data['goal'],
        motivation=data['motivation'],
        education=data['education'],
        organization=data['organization']
    )
    db.session.add(new_registration)
    db.session.commit()
    return jsonify({"message": "Registration submitted successfully"}), 201