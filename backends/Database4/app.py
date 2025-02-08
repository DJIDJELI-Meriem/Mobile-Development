from flask import Flask, request, jsonify
from flask_cors import CORS
from supabase_client import supabase_client 
import os
import random
from datetime import datetime, timedelta

app = Flask(__name__)
CORS(app)  # Allow Flutter to access this API

@app.route('/add_hackathon', methods=['POST', "GET"])
def add_hackathon():
    # Generate random data for the hackathon
    random_id = random.randint(1000, 9999)
    start_date = datetime.today()
    end_date = start_date + timedelta(days=random.randint(2, 7))
    announce_hack_date = start_date - timedelta(days=10)
    announce_winner_date = end_date + timedelta(days=1)

    data = {
        "hack_id": random_id,
        "start_date": start_date.strftime("%Y-%m-%d"),
        "end_date": end_date.strftime("%Y-%m-%d"),
        "place": random.choice(["Algeria", "France", "USA", "Germany"]),
        "topic": random.choice(["AI", "Blockchain", "Cybersecurity", "IoT"]),
        "tags": "tech, innovation, programming",
        "description": "A competitive hackathon for developers.",
        "winner_prizes": random.choice(["Laptops", "Cash Prize", "Internship"]),
        "sponsors": random.choice(["Google", "Microsoft", "OpenAI"]),
        "creators": random.choice(["University A", "Tech Community B", "Startup C"]),
        "announce_hack_date": announce_hack_date.strftime("%Y-%m-%d"),
        "announce_winner_date": announce_winner_date.strftime("%Y-%m-%d"),
    }

    try:
        response = supabase_client.table("Hackathon").insert([data]).execute()
        return jsonify({"message": "Hackathon added successfully!", "data": response.data}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@app.route('/get_hackathons', methods=['GET'])
def get_hackathons():
    try:
        response = supabase_client.table("Hackathon").select("*").execute()
        return jsonify({"Hackathons": response.data}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@app.route('/get_hackathon/<int:hackathon_id>', methods=['GET'])
def get_hackathon(hackathon_id):
    try:
        response = supabase_client.table("Hackathon").select("*").eq("hack_id", hackathon_id).single().execute()
        if response.data:
            return jsonify(response.data), 200
        else:
            return jsonify({"error": "Hackathon not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500




#100%%%%%

@app.route('/get_participant_info/<int:part_id>', methods=['GET'])
def get_participant(part_id):
    try:
        response = supabase_client.table("Participant").select("*").eq("part_id", part_id).execute()
        
        if response.data and len(response.data) > 0:
            return jsonify(response.data[0]), 200  # Return first matching result
        else:
            return jsonify({"error": "Participant not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500




@app.route('/get_all_participants', methods=['GET'])
def get_all_participants():
    try:
        response = supabase_client.table("Participant").select("*").execute()
        return jsonify({"participants": response.data}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500





@app.route('/add_test_participant', methods=['POST'])
def add_test_participant():
    test_participant = {
        "part_id": random.randint(1000, 9999),  # Use a random ID to avoid duplicates
        "part_first_name": "John",
        "part_last_name": "Doe",
        "part_email": "john.doe@example.com",
        "part_password": "securepassword"
    }
    
    try:
        response = supabase_client.table("Participant").insert([test_participant]).execute()
        print("Insert Response:", response)  # Debugging
        return jsonify({"message": "Test participant added!", "data": response.data}), 201
    except Exception as e:
        print("Insert Error:", e)  # Print the actual error
        return jsonify({"error": str(e)}), 400





# 100%%%%%%%
@app.route('/get_admin_info/<int:admin_id>', methods=['GET'])
def get_admin(admin_id):
    try:
        response = supabase_client.table("Admin").select("*").eq("admin_id", admin_id).execute()
        
        if response.data and len(response.data) > 0:
            return jsonify(response.data[0]), 200  # Return first matching result
        else:
            return jsonify({"error": "Admin not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500






#100%%%%%%%%%%%
@app.route('/add_skill', methods=['POST', 'GET'])
def add_skill():
    if request.method == 'POST':
        try:
            data = request.json
            part_id = data.get("part_id_foreign")
            skill_name = data.get("skill")

            print(f"Received skill: {skill_name} for participant ID: {part_id}")  # Debugging

            if not part_id or not skill_name:
                return jsonify({"error": "Missing required fields (part_id_foreign, skill)"}), 400

            # Check if the participant exists
            participant_check = supabase_client.table("Participant").select("part_id").eq("part_id", part_id).execute()

            if not participant_check.data:
                return jsonify({"error": f"Participant with ID {part_id} does not exist"}), 404

            # Generate a random skill_id
            random_skill_id = random.randint(1000, 9999)

            skill_data = {
                "skill_id": random_skill_id,
                "skill": skill_name,
                "part_id_foreign": part_id
            }

            response = supabase_client.table("Skill").insert([skill_data]).execute()
            print(f"Skill inserted: {response.data}")  # Debugging
            return jsonify({"message": "Skill added successfully!", "data": response.data}), 201

        except Exception as e:
            print(f"Error: {e}")  # Debugging
            return jsonify({"error": str(e)}), 400



#Testing part-----------------------------------
# from flask import Flask, request, jsonify
# from flask_cors import CORS
# from supabase_client import supabase_client
# import bcrypt
# import random

# app = Flask(__name__)
# CORS(app) 
# @app.route('/signup', methods=['POST'])
# def signup():
#     try:
#         data = request.json
#         first_name = data.get("first_name")
#         last_name = data.get("last_name")
#         email = data.get("email")
#         password = data.get("password")

#         if not first_name or not last_name or not email or not password:
#             return jsonify({"error": "All fields are required"}), 400

#         # Check if email already exists
#         existing_user = supabase_client.table("Participant").select("*").eq("part_email", email).execute()
#         if existing_user.data:
#             return jsonify({"error": "Email already registered"}), 400

#         # Hash password
#         hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

#         # Generate a random user ID
#         part_id = random.randint(1000, 9999)

#         # Insert user into Supabase
#         user_data = {
#             "part_id": part_id,
#             "part_first_name": first_name,
#             "part_last_name": last_name,
#             "part_email": email,
#             "part_password": hashed_password
#         }

#         response = supabase_client.table("Participant").insert([user_data]).execute()
#         return jsonify({"message": "User registered successfully!", "user_id": part_id}), 201

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500


# # Login Route
# @app.route('/login', methods=['POST'])
# def login():
#     try:
#         data = request.json
#         email = data.get("email")
#         password = data.get("password")

#         if not email or not password:
#             return jsonify({"error": "Email and password are required"}), 400

#         # Fetch user from the database
#         response = supabase_client.table("Participant").select("*").eq("part_email", email).execute()

#         if not response.data:
#             return jsonify({"error": "User not found"}), 404

#         user = response.data[0]

#         # Check password
#         if bcrypt.checkpw(password.encode('utf-8'), user["part_password"].encode('utf-8')):
#             return jsonify({
#                 "message": "Login successful",
#                 "user_id": user["part_id"],
#                 "first_name": user["part_first_name"],
#                 "last_name": user["part_last_name"],
#                 "email": user["part_email"]
#             }), 200
#         else:
#             return jsonify({"error": "Invalid password"}), 401

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500



#100%%%%%%%%%%
@app.route('/get_profile_participant/<int:participant_id>', methods=['GET'])
def get_profile_participant(participant_id):
    try:
        response = supabase_client.table("Participant").select("*").eq("part_id", participant_id).single().execute()
        
        if response.data:
            return jsonify(response.data), 200
        else:
            return jsonify({"error": "Participant not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500







@app.route('/get_profile_admin/<int:Admin_id>', methods=['GET'])
def get_profile_Admin(Admin_id):
    try:
        response = supabase_client.table("Admin").select("*").eq("admin_id", Admin_id).single().execute()
        
        if response.data:
            return jsonify(response.data), 200
        else:
            return jsonify({"error": "Admin not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500




@app.route('/update_participant/<int:participant_id>', methods=['PUT'])
def update_participant(participant_id):
    try:
        data = request.json
        response = supabase_client.table("Participant").update(data).eq("part_id", participant_id).execute()
        return jsonify({"message": "Participant updated successfully!", "data": response.data}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    










@app.route("/get_skills/<int:participant_id>", methods=["GET"])
def get_skills(participant_id):
    try:
        # Query the "Skill" table where part_id_foreign matches
        response = supabase_client.table("Skill").select("*").eq("part_id_foreign", participant_id).execute()
        
        skills = response.data  # Extract data from response
        
        if not skills:
            return jsonify({"message": "No skills found for this participant"}), 404

        return jsonify(skills), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    



@app.route("/add_skill", methods=["POST"])
def add_participant_skill():
    try:
        data = request.get_json()

        # Validate required fields
        if "skill" not in data or "part_id_foreign" not in data:
            return jsonify({"error": "Missing required fields (skill, part_id_foreign)"}), 400

        # Insert into Skill table
        response = supabase_client.table("Skill").insert({
            "skill": data["skill"],
            "part_id_foreign": data["part_id_foreign"]
        }).execute()

        return jsonify({"message": "Skill added successfully", "data": response.data}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    




if __name__ == '__main__':
    app.run(debug=True)
