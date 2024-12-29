import 'package:flutter/cupertino.dart';

class TestApp extends ChangeNotifier {
  String? name;

  List<String> namesList = [];

  String? get textName => name;

  List<String> get namesListData => namesList;

  Future<List<String>> funList(String? names) async {
    namesList.add(names!);
    notifyListeners();
    return namesList;
  }
}
