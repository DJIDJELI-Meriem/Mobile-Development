import requests
import time

# Define the URL of your Flask app's signup endpoint
url = "http://127.0.0.1:5000/signup"

# Generate a unique email using timestamp
email = f"testuser{int(time.time())}@example.com"

# Define the payload
payload = {
    "user_type": "admin",
    "first_name": "hadji",
    "last_name": "lina",
    "email": "gsdhshd.kjds87237@ensia.edu.dz",  # Unique email
    "password": "jsdewewu"
}

# Send a POST request
response = requests.post(url, json=payload)

# Print the response
print("Status Code:", response.status_code)
print("Response JSON:", response.json())
