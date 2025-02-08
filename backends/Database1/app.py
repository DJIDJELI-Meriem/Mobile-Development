from flask import Flask, request, jsonify, session
from flask_cors import CORS
from flask_bcrypt import Bcrypt
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from supabase import create_client, Client
import random
import logging
from flask_cors import CORS  


# Initialize Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key_here'  # Needed for session handling

CORS(app, supports_credentials=True, resources={r"/*": {"origins": "*"}})
  # Allow Flutter to access this API


# Supabase connection
SUPABASE_URL = "https://dmsjruguiciyfjmpgwmg.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRtc2pydWd1aWNpeWZqbXBnd21nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5NDIwODQsImV4cCI6MjA1NDUxODA4NH0.YgAxmviqtgsu9RlOYvNuXUZBIBuxTmXzmsXxpPIcv3o"

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# Setup rate limiter
limiter = Limiter(key_func=get_remote_address)
limiter.init_app(app)

# Configure logging
logging.basicConfig(level=logging.DEBUG)


@app.route('/signup', methods=['POST'])
@limiter.limit("10 per minute")  # Apply rate limit
def signup():
    data = request.json

    user_type = data.get("user_type")  # Should be "admin" or "participant"
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    email = data.get("email")
    password = data.get("password")

    if not all([user_type, first_name, last_name, email, password]):
        return jsonify({"error": "Missing required fields"}), 400

    try:
        # Sign up user in Supabase Authentication
        auth_response = supabase.auth.sign_up({
            "email": email,
            "password": password
        })

        if auth_response.get("error"):
            return jsonify({"error": auth_response["error"]["message"]}), 400

        # Hash password before storing it in the database
        hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

        # Select the correct table
        table_name = "Admin" if user_type.lower() == "admin" else "Participant"

        user_data = {
            "admin_id" if user_type.lower() == "admin" else "part_id": random.randint(1000, 9999),
            "admin_first_name" if user_type.lower() == "admin" else "part_first_name": first_name,
            "admin_last_name" if user_type.lower() == "admin" else "part_last_name": last_name,
            "admin_email" if user_type.lower() == "admin" else "part_email": email,
            "admin_password" if user_type.lower() == "admin" else "part_password": hashed_password
        }

        # Insert into the correct table
        insert_response = supabase.table(table_name).insert(user_data).execute()

        if "error" in insert_response:
            return jsonify({"error": insert_response["error"]["message"]}), 400

        return jsonify({"message": f"{user_type.capitalize()} registered successfully"}), 201

    except Exception as e:
        logging.error(f"Signup Error: {str(e)}")
        return jsonify({"error": str(e)}), 500



@app.route('/login', methods=['POST', 'OPTIONS'])  # Allow preflight requests
def login():
    if request.method == 'OPTIONS':
        return jsonify({"message": "Preflight request successful"}), 200  # Handle CORS preflight

    data = request.get_json()
    if not data:
        return jsonify({"error": "Invalid request, JSON required"}), 400

    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Email and password are required"}), 400

    # Check Participant table
    participant_response = supabase.table('Participant').select('*').eq('part_email', email).execute()
    participant_data = participant_response.data if participant_response.data else []

    if participant_data:
        stored_password = participant_data[0]['part_password']
        if stored_password== password:
            session['user_id'] = participant_data[0]['part_id']
            session['user_type'] = 'participant'
            return jsonify({"message": "Logged in as participant"}), 201
        else:
            return jsonify({"error": "Password is incorrect"}), 401

    # Check Admin table
    admin_response = supabase.table('Admin').select('*').eq('admin_email', email).execute()
    admin_data = admin_response.data if admin_response.data else []

    if admin_data:
        stored_password = admin_data[0]['admin_password']
        if stored_password== password:
            session['user_id'] = admin_data[0]['admin_id']
            session['user_type'] = 'admin'
            return jsonify({"message": "Logged in as admin"}), 200
        else:
            return jsonify({"error": "Password is incorrect"}), 401

    return jsonify({"error": "Email does not exist"}), 404




@app.route('/logout', methods=['POST'])
def logout():
    session.pop("user", None)
    return jsonify({"message": "Logged out successfully"}), 200

@app.route('/check_session', methods=['GET'])
def check_session():
    if "user" in session:
        return jsonify({"session": session["user"]}), 200
    else:
        return jsonify({"error": "No active session"}), 401


# @app.route('/participants', methods=['GET'])
# def get_participants():
#     try:
#         # Fetch all participants
#         response = supabase.table("Participant").select("*").execute()
#         if response.data:
#             return jsonify(response.data), 200
#         return jsonify({"error": "No participants found"}), 404
#     except Exception as e:
#         logging.error(f"Error fetching participants: {str(e)}")
#         return jsonify({"error": "Internal Server Error"}), 500




@app.route('/participants/<int:hackathon_id>', methods=['GET'])
def get_participants_by_hackathon(hackathon_id):
    # Fetch participant IDs
    response = supabase.table("Part_reg_form").select("part_id_fr").eq("hack_id_fr", hackathon_id).execute()
    

    if not response.data:
        return jsonify({"message": "No participants found for this hackathon"}), 404

    participant_ids = [entry["part_id_fr"] for entry in response.data]

    # Fetch participant details
    participants_response = supabase.table("Participant").select("*").in_("part_id", participant_ids).execute()

    print("DEBUG: Participant Response ->", participants_response.data)  # ✅ Print response to debug

    if not participants_response.data:
        return jsonify({"message": "Participants data not found"}), 404
    
    return jsonify(participants_response.data)




 
@app.route('/get_hackathons', methods=['GET'])
def get_hackathons():
    try:
        response = supabase.table("Hackathon").select("hackathon_name, end_date").execute()
        return jsonify({"Hackathons": response.data}), 200  # Ensure the key is "Hackathons"
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    

@app.route('/get_mycreatedhackathons', methods=['GET'])
def get_mycreatedhackathons():
    try:
        # Fetch only "hackathon_name", "field", and "topic" from the "Hackathon" table
        response = supabase.table("Hackathon").select("hackathon_name, field, topic").execute()
        return jsonify({"Hackathons": response.data}), 200  # Ensure the key is "Hackathons"
    except Exception as e:
        return jsonify({"error": str(e)}), 400


if __name__ == '__main__':
    app.run(debug=True)