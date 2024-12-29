import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static String baseUrl = '';

  static Map<String, String> get header {
    return {
      'Content-Type': 'application/json'
      // 'Authorization': 'Bearer'
    };
  }

  Future<dynamic> getApi(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/$endpoint'), headers: header);
      return _headerResponse(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> postApi(String endpoint, dynamic body) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/$endpoint'),
          headers: header, body: json.encode(body));
      return _headerResponse(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> putApi(String endpoint, dynamic body) async {
    try {
      final response = await http.put(Uri.parse('$baseUrl/$endpoint'),
          headers: header, body: json.encode(body));
      return _headerResponse(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> deleteApi(String endpoint) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: header);
      return _headerResponse(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static dynamic _headerResponse(http.Response response) {
    try {
      if (response.statusCode == 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        return {
          'error': {'status': response.statusCode, 'message': response.body}
        };
      }
    } catch (e) {
      return {
        'error': {'status': 500, 'message': 'internal server error'}
      };
    }
  }
}
