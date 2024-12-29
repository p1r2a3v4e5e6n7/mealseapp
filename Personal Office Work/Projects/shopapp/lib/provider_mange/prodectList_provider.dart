import 'package:flutter/material.dart';

import '../models/prodect_model.dart';

class ProviderList extends ChangeNotifier {
  final List<ShoeList> _products = [
    ShoeList(
        name: "Ultraboost Shoes",
        price: 200.0,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s",
        des: "des"),
    ShoeList(
        name: "Air Max Shoes",
        price: 250.0,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s",
        des: "des"),
  ];

  List<ShoeList> get products => _products;

  Future<List<ShoeList>> fetchProductListData() async {
    await Future.delayed(Duration(seconds: 2));
    notifyListeners();
    return _products;
  }
}
