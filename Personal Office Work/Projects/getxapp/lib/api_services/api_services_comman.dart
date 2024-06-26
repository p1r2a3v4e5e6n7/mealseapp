import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiServicesCall {
  // static const String baseUrl = "http://192.168.1.40:1337/api/";
  // static const String baseUrl = "https://parking.eagleminds.net/api/";
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Map<String, String> get headers {
    // if (MyApp.user != null &&
    //     MyApp.user!.jwt != null &&
    //     MyApp.user!.jwt.isNotEmpty) {
    //   return {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer ${MyApp.user!.jwt}',
    //   };
    // } else {
    return {'Content-Type': 'application/json'};
    // }
  }

  static Future<dynamic> getRequest(
      String endpoint, BuildContext? context) async {
    final response =
        await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
    return _handleResponse(response, context!);
  }

  static Future<dynamic> postRequestLocal(
      String endpoint, dynamic body, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: json.encode(body),
    );
    return _handleResponse(response, context);
  }

  static Future<dynamic> putRequest(
      String endpoint, Map<String, dynamic> body, BuildContext context) async {
    final response = await http.put(Uri.parse('$baseUrl$endpoint'),
        headers: headers, body: json.encode(body));
    return _handleResponse(response, context);
  }

  static Future<dynamic> deleteRequest(
      String endpoint, BuildContext context) async {
    final response =
        await http.delete(Uri.parse('$baseUrl$endpoint'), headers: headers);

    return _handleResponse(response, context);
  }

  static dynamic _handleResponseLocal(
      http.Response response, BuildContext context) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      Map<String, dynamic> errorResponse = {
        'error': {
          'status': response.statusCode,
          'message': 'Request failed with : ${response.body}',
        }
      };
      return errorResponse;
    }
  }

  static dynamic _handleResponse(http.Response response, BuildContext context) {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        Map<String, dynamic> errorResponse = {
          'error': {
            'status': response.statusCode,
            'message': 'Request failed with : ${response.body}',
          }
        };

        if (response.statusCode == 404) {
        } else if (response.statusCode == 401) {
        } else if (response.statusCode == 400) {
        } else if (response.statusCode == 500) {
        } else {}

        return errorResponse;
      }
    } catch (e) {
      print('Exception during response handling: $e');

      return {
        'error': {
          'status': 500,
          'message': 'Internal server error',
        }
      };
    }
  }
}
