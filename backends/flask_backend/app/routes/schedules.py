from flask import Blueprint, request, jsonify
from ..models.schedule import Schedule
from .. import db

bp = Blueprint('schedules', __name__)

@bp.route('/schedules', methods=['POST'])
def submit_schedule():
    data = request.get_json()
    new_schedule = Schedule(
        task=data['task'],
        start_time=data['start_time'],
        end_time=data['end_time'],
        place=data['place']
    )
    db.session.add(new_schedule)
    db.session.commit()
    return jsonify({"message": "Schedule submitted successfully"}), 201