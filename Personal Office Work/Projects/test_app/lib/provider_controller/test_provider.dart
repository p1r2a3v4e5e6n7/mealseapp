import 'package:flutter/foundation.dart';

import '../main.dart';

class TestProvider extends ChangeNotifier {
  List<dynamic> listData = [];

  Future<List<dynamic>> getData() async {
    List<String> data = ['name', 'data'];
    listData.addAll(data);
    notifyListeners();
    return listData;
  }

  Future<void> preFrance() async {
    await MyApp.data.getFun();
    notifyListeners();
  }
}
