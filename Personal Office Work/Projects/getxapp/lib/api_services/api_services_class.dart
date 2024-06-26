import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'db_services.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final DatabaseService _databaseService = DatabaseService();

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<User> users =
            jsonResponse.map((user) => User.fromJson(user)).toList();
        await _databaseService.clearUsers();
        for (var user in users) {
          await _databaseService.insertUser(user);
        }
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      return await _databaseService.getUsers();
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
