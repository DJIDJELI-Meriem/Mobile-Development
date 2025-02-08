from flask import Blueprint, request, jsonify
from ..models.event import Event
from .. import db
import json  # Import for logging

bp = Blueprint('events', __name__)

@bp.route('/events', methods=['POST'])
def create_event():
    data = request.get_json()

    # Debugging: Print the received data in a readable format
    print("Received Request Data:", json.dumps(data, indent=4))

    # Validate incoming data
    required_fields = ['field', 'topic', 'place', 'start_date', 'end_date',
                        'price', 'first_prize', 'second_prize', 'third_prize', 'description' , 'sponsors' , 'creators', 'hackathon_name']
    for field in required_fields:
        if field not in data:
            return jsonify({"error": f"Missing field: {field}"}), 400

    new_event = Event(
        field=data['field'],
        topic=data['topic'],
        place=data['place'],
        start_date=data['start_date'],
        end_date=data['end_date'],
        price=data['price'],
        first_prize=data['first_prize'],
        second_prize=data['second_prize'],
        third_prize=data['third_prize'],
        description=data['description'],
        sponsors=data['sponsors'],
        creators=data['creators'],
    )
    db.session.add(new_event)
    db.session.commit()
    return jsonify({"message": "Event created successfully"}), 201
