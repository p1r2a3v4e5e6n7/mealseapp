import 'package:flutter/cupertino.dart';

class TestProviderController extends ChangeNotifier {
  String? name;
  int count = 0;
  List<String> listName = ["pk", "R", "N", "V"];

  String? get userName => name;
  int get countNum => count;
  List<String> get listUserNames => listName;

  void nameFun() {
    count++;
    name = "Ragul";
    listUserNames.add("T");
    notifyListeners();
  }
}
