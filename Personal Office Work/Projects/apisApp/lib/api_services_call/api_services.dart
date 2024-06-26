import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServicesCall {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Map<String, String> get headers {
    return {'Content-Type': 'application/json'};
  }

  //GET Request

  static Future<dynamic> getRequest(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);

      return _handelResponse(response);
    } catch (e) {
      return throw (e.toString());
    }
  }

  //POST Request

  static Future<dynamic> postRequest(String endpoint, dynamic body) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/$endpoint'),
          headers: headers, body: json.encode(body));
      return _handelResponse(response);
    } catch (e) {
      return throw (e.toString());
    }
  }

  //PUT Request

  static Future<dynamic> putRequest(String endpoint, dynamic body) async {
    try {
      final response = await http.put(Uri.parse('$baseUrl/$endpoint'),
          headers: headers, body: json.encode(body));
      return _handelResponse(response);
    } catch (e) {
      return throw (e.toString());
    }
  }

  //DELETE Request

  static Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: headers);

      return _handelResponse(response);
    } catch (e) {
      return throw (e.toString());
    }
  }

  static dynamic _handelResponse(http.Response response) {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        return {
          'error': {'status': response.statusCode, 'message': response.body}
        };
      }
    } catch (e) {
      // return throw (e.toString());
      return {
        'error': {'status': 500, 'message': 'Internal server error'}
      };
    }
  }
}
