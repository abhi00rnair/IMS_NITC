import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/studentdash.dart';

class ApiService {
  static String baseUrl = 'http://192.168.1.3:2000/api/student';

  static Future<Studentdash?> getStudent(String token) async {
    print("🔁 Attempting to fetch student data...");
    print("🔐 Using token: $token");

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print("📡 Request sent to: $baseUrl");
      print("📥 Response status: ${response.statusCode}");
      print("📦 Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("✅ Successfully parsed student data.");
        return Studentdash.fromJson(data);
      } else {
        print("❌ Failed to load student. Status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("💥 Error fetching student: $e");
      return null;
    }
  }
}
