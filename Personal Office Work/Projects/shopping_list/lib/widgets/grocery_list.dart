import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widgets/new_item.dart';

import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItems> _groceryItem = [];

  late Future<List<GroceryItems>> _loadedItem;
  String? _error;
  @override
  void initState() {
    super.initState();
    _loadedItem = _loadItems();
  }

  Future<List<GroceryItems>> _loadItems() async {
    final url = Uri.https(
      'shopping-app-95861-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try agin later.');
    }

    if (response.body == 'null') {
      return [];
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItems> _loadedItem = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      _loadedItem.add(GroceryItems(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }

    return _loadedItem;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItems>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
  }

  void _onRemoveItem(GroceryItems item) async {
    final index = _groceryItem.indexOf(item);
    setState(() {
      _groceryItem.remove(item);
    });
    final url = Uri.https(
      'shopping-app-95861-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItem.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _loadedItem,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text("No items added yet."));
            }

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      _onRemoveItem(snapshot.data![index]);
                    },
                    key: ValueKey(snapshot.data![index].id),
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      leading: Container(
                        height: 24,
                        width: 24,
                        color: snapshot.data![index].category.color,
                      ),
                      trailing: Text(snapshot.data![index].quantity.toString()),
                    ),
                  );
                });
          }),
    );
  }
}
