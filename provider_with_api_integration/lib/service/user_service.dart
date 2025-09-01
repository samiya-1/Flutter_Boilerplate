import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_boilerplate_flutter/models/user_model.dart';

// Alternative API Service using a different endpoint
class ApiService {
  static const String _baseUrl = 'https://reqres.in/api';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));

    if (response.statusCode == 200) {
      // your User.fromJson to handle it correctly.
      final data = json.decode(response.body);
      final usersData = data['data'] as List;
      return usersData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}
