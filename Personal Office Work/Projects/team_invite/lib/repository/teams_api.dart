import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/teams_list.dart';

String? tokenId = 'https://marlo-neobank.web.app/overview';

Future<UserModel> teamsPostFunction(Result users) async {
  final response = await http.post(Uri.parse(
      'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/invites'));

  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("wrong");
  }
}

Future<UserModel> teamsGetFunction() async {
  final response = await http.get(Uri.parse(
      'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams'));

  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("wrong");
  }
}
