import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:5000"; // Replace with your actual backend URL

  /// **Login Function**
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      print("Login successful: ${response.body}");
      return true;
    } else {
      print("Login failed: ${response.body}");
      return false;
    }
  }

  /// **Fetch Participants Function**
  Future<List<Map<String, dynamic>>?> getParticipants(int hackathonId) async {
    final url = Uri.parse("$baseUrl/participants/$hackathonId");

    try {
      final response = await http.get(url);
      print("Fetching from: https://yourapi.com/participants");


      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print("Failed to fetch participants: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error fetching participants: $e");
      return null;
    }
  }

   
static Future<List<dynamic>?> getHackathons() async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/get_hackathons"));
    print("API Response: ${response.body}"); // Debugging
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Hackathons"];
    } else {
      print("Error: ${response.body}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}

static Future<List<dynamic>?> getMyCreatedHackathons() async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/get_mycreatedhackathons"));
    print("API Response: ${response.body}"); // Debugging
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Hackathons"];
    } else {
      print("Error: ${response.body}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}

}
