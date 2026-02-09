import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mindmate/model/mood_models.dart';

class MoodService {
  final String baseUrl = "http://10.172.37.122:3000";

  Future<Map<String, dynamic>> submitMood(
      String userId,
      String mood,
      ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/mood/submit"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userId": userId,
        "mood": mood,
      }),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getMoodStreak(String userId) async {
    final response =
    await http.get(Uri.parse("$baseUrl/mood/streak/$userId"));
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getAverageMood(String userId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/mood/average/$userId"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch average mood");
    }

    return jsonDecode(response.body);
  }
  Future<List<Mood>> getRecentMoods(String userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/mood/$userId"));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Mood.fromJson(json)).toList();
      } else {
        print("Error fetching moods: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Network error: $e");
      return [];
    }
  }

}
