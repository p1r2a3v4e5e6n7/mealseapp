import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/test_model.dart';

class SharedData {
  setFun(TestModel login) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String localData = jsonEncode(login);
    preferences.setString('localData', localData);
  }

  getFun() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? localData = preferences.getString('localData');
    print(localData);
    if (localData != null) {
      Map<String, dynamic> json = jsonDecode(localData);
      TestModel test = TestModel.form(json);
      print(test);
      MyApp.testData = test;
    } else {
      print('test');
    }
  }
}
