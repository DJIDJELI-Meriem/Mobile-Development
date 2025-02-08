import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://127.0.0.1:5000"; // Replace with your Flask server URL

  // Fetch participant info by ID
  static Future<Map<String, dynamic>?> getParticipantInfo(
      int participantId) async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl/get_participant_info/$participantId"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

  // Fetch all participants
  static Future<List<dynamic>?> getAllParticipants() async {
    try {
      final response =
          await http.get(Uri.parse("$baseUrl/get_all_participants"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body)["participants"];
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

  // Add a skill for a participant
 static Future<bool> addSkill___(int participantId, String skill) async {
  try {
    print("Sending request to add skill: $skill for participant ID: $participantId"); // Debugging
    final response = await http.post(
      Uri.parse("$baseUrl/add_skill"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "part_id_foreign": participantId,
        "skill": skill,
      }),
    );

    print("Response status code: ${response.statusCode}"); // Debugging
    print("Response body: ${response.body}"); // Debugging

    if (response.statusCode == 201) {
      return true; // Skill added successfully
    } else {
      print("Error: ${response.body}");
      return false; // Failed to add skill
    }
  } catch (e) {
    print("Exception: $e");
    return false; // Failed to add skill
  }
}



  // Update participant info
static Future<bool> updateParticipant(int participantId, Map<String, dynamic> updateData) async {
  try {
    final response = await http.put(
      Uri.parse("$baseUrl/update_participant/$participantId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(updateData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Exception: $e");
    return false;
  }
}

// #Testing part
  // Signup function
  // static Future<bool> signup(
  //     String firstName, String lastName, String email, String password) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("$baseUrl/signup"),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "first_name": firstName,
  //         "last_name": lastName,
  //         "email": email,
  //         "password": password,
  //       }),
  //     );

  //     return response.statusCode == 201;
  //   } catch (e) {
  //     print("Exception: $e");
  //     return false;
  //   }
  // }

  // // Login function
  // static Future<Map<String, dynamic>?> login(
  //     String email, String password) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("$baseUrl/login"),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "email": email,
  //         "password": password,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       print("Login Error: ${response.body}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //     return null;
  //   }
  // }




   
  // Fetch a participant by ID
  static Future<Map<String, dynamic>?> get_profile_participant_by_id(int partid) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/get_profile_participant/$partid"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }






  // Fetch a admin by ID
  static Future<Map<String, dynamic>?> get_profile_admin_by_id(int adminid) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/get_profile_admin/$adminid"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }






   // Fetch skills of a participant by ID
  static Future<List<dynamic>> getSkills(int participantId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/get_skills/$participantId"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        return []; // No skills found
      } else {
        throw Exception("Failed to fetch skills: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }





 
  // Add Skill to a Participant
  static Future<bool> addSkill(int participantId, String skill) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_skill"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "skill": skill,
        "part_id_foreign": participantId,
      }),
    );

    return response.statusCode == 201;
  }




}
