import os
import json
from flask import Flask, request, jsonify
from flask_cors import CORS
from supabase import create_client, Client

# Load Supabase environment variables
SUPABASE_URL = "https://dmsjruguiciyfjmpgwmg.supabase.co/rest/v1"
SUPABASE_KEY ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRtc2pydWd1aWNpeWZqbXBnd21nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5NDIwODQsImV4cCI6MjA1NDUxODA4NH0.YgAxmviqtgsu9RlOYvNuXUZBIBuxTmXzmsXxpPIcv3o"

if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("Supabase environment variables not set.")

# Supabase client initialization
supabase_client: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# Initialize Flask app
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})


@app.route('/api/Hackathon', methods=['POST'])
def create_hackathon():
    # # Get JSON data from the request
    # data = request.get_json()
    # print("Received Request Data:", json.dumps(data, indent=4))

    # # Define required fields
    # required_fields = ['field', 'topic', 'place', 'start_date', 'end_date',
    #                     'price', 'first_prize', 'second_prize', 'third_prize',
    #                     'description', 'sponsors', 'creators', 'hackathon_name']

    # # Validate the request data
    # missing_fields = [field for field in required_fields if field not in data]
    # if missing_fields:
    #     return jsonify({"error": f"Missing fields: {', '.join(missing_fields)}"}), 400

    # try:
    #     # Insert data into Supabase
    #     response = supabase_client.table("Hackathon").insert(data).execute()
        
    #     print("Supabase Raw Response:", response)
    #     print("Supabase Response Status:", response.status_code)
    #     print("Supabase Response Text:", response.text)

    #     # Handle possible error or empty responses
    #     if response.data:
    #         return jsonify({"message": "Hackathon event created successfully", "data": response.data}), 201
    #     else:
    #         return jsonify({"error": "Supabase returned an empty or invalid response"}), 500

    # except Exception as e:
    #     print("Error occurred:", str(e))
    #     return jsonify({"error": str(e)}), 500

  try:
    response = supabase_client.table("Hackathon").insert({
        "field": "AI",
        "topic": "Innovation",
        "place": "Riyadh",
        "start_date": "2025-02-10",
        "end_date": "2025-02-12",
        "price": "1000",
        "first_prize": "5000",
        "second_prize": "2500",
        "third_prize": "1000",
        "description": "Test Hackathon",
        "sponsors": "Test Sponsor",
        "creators": "Test Creator",
        "hackathon_name": "HackTest"
    }).execute()

    print("Response:", response.data)
    print("Error:", response.error)
  except Exception as e:
    print("Exception occurred:", e)



if __name__ == '__main__':
    print("Running the Flask backend...")
    app.run(debug=True)
