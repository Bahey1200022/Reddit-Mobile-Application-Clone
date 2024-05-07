import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sarakel/constants.dart';

class MutedUsersService {
  static Future<List<String>> getMutedUsers(
      String token, String communityName) async {
    final url =
        '$BASE_URL/api/r/$communityName/about/muted'; // Replace with your backend API endpoint

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Set the authorization header
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // If the request is successful
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> mutedList = responseData['mutedUsers'];
        return mutedList.map((e) => e.toString()).toList();
      } else {
        // If the request fails
        throw Exception('Failed to load muted users');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }
}
