from flask import Flask, request, jsonify
from flask_cors import CORS
from supabase_client import supabase_client 
import os
import random
from datetime import datetime, timedelta, date


app = Flask(__name__)
CORS(app)  # Allow Flutter to access this API







@app.route('/add_hackathon', methods=['POST', "GET"])
def add_hackathon():
    
    ## data = request.json


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
        return jsonify({"Hackathon s": response.data}), 200
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
    




@app.route('/get_hackathon_form/<int:hackathon_id>', methods=['GET'])
def get_hackathon_form(hackathon_id):
    try:
        response = supabase_client.table("Registration_form").select("*").eq("reg_id", hackathon_id).single().execute()
        
        if response.data:
            return jsonify(response.data), 200
        else:
            return jsonify({"error": "Hackathon form not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500



@app.route('/get_hackathons_by_admin/<int:admin_id>', methods=['GET'])
def get_hackathons_by_admin(admin_id):
    try:
        # Fetch hackathons by Admin ID
        response = supabase_client.table("Hackathon").select("*").eq("Admin_fr_key", admin_id).execute()
        hackathons = response.data

        if not hackathons:
            return jsonify({"error": "No hackathons found for this admin"}), 404

        today = date.today().isoformat()  # Get today's date in YYYY-MM-DD format

        # Classify hackathons as "Done" or "Upcoming"
        done = [hack for hack in hackathons if hack["end_date"] < today]
        upcoming = [hack for hack in hackathons if hack["end_date"] >= today]

        return jsonify({"done": done, "upcoming": upcoming}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500





@app.route('/get_hackathons_by_participant/<int:participant_id>', methods=['GET'])
def get_hackathons_by_participant(participant_id):
    try:
        # Get Hackathon IDs where participant is accepted
        response = supabase_client.table("Accept").select("hackathon_id_fr").eq("Particioant_id_fr", participant_id).execute()
        hackathon_ids = [entry["hackathon_id_fr"] for entry in response.data]

        if not hackathon_ids:
            return jsonify({"error": "No hackathons found for this participant"}), 404

        # Fetch Hackathon details
        response = supabase_client.table("Hackathon").select("*").in_("hack_id", hackathon_ids).execute()
        hackathons = response.data

        today = date.today().isoformat()  # YYYY-MM-DD format

        # Classify hackathons as "Done" or "Upcoming"
        done = [hack for hack in hackathons if hack["end_date"] < today]
        upcoming = [hack for hack in hackathons if hack["end_date"] >= today]

        return jsonify({"done": done, "upcoming": upcoming}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    




@app.route("/agenda/<int:hackathon_id>", methods=["GET"])
def get_agenda_by_hackathon(hackathon_id):
    # Fetch Agenda
    agenda_response = supabase_client.table("Agenda").select("*").eq("hackathon_foreign", hackathon_id).execute()
    
    if not agenda_response.data:
        return jsonify({"error": "Agenda not found for this hackathon ID"}), 404

    agenda = agenda_response.data[0]  # Assuming only one agenda per hackathon
    print("Agenda Retrieved:", agenda)

    # Fetch Related Day Plans
    day_plan_response = supabase_client.table("Day_Plan").select("*").eq("Agenda_id_Foreign", agenda["Agenda_id"]).execute()

    # Structure response
    response = {
        "Agenda_id": agenda["Agenda_id"],
        "hackathon_id": hackathon_id,
        "Day_Plans": [
            {
                "Day_Plan_id": dp["Day_Plan_id"],
                "day": dp["day"],
                "description": dp["description"]
            }
            for dp in day_plan_response.data
        ]
    }

    return jsonify(response)



@app.route("/upload", methods=["POST"])
def upload_image():
    if "image" not in request.files:
        return jsonify({"error": "No image file provided"}), 400

    image = request.files["image"]
    image_data = image.read()  # Read binary data
    image_name = image.filename

    # Upload image to Supabase Storage
    response = supabase_client.storage.from_("images").upload(image_name, image_data)

    if "error" in response:
        return jsonify({"error": response["error"]}), 500

    # Generate public URL
    public_url = f"{SUPABASE_URL}/storage/v1/object/public/images/{image_name}"

    return jsonify({"message": "Image uploaded", "url": public_url})



if __name__ == '__main__':
    app.run(debug=True)
