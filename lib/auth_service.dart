import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthService {
  final String baseUrl = "http://localhost:3000";

  Future<String> registerUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return "User Registered";
    } else {
      return "Error: ${jsonDecode(response.body)['error']}";
    }
  }
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data["token"]);
        return {"success": true, "token": data["token"], "message": data["message"]};
      } else {
        final data = jsonDecode(response.body);
        return {"success": false, "message": data["error"]};
      }
    } catch (e) {
      return {"success": false, "message": "Unable to connect to server"};
    }
  }

}
