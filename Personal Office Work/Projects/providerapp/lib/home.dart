import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/list_provider.dart';

import 'second.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NumberListProvider>(
        builder: (context, numberListProvider, child) => Column(
          children: [
            Text(
              numberListProvider.number.last.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: numberListProvider.number.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numberListProvider.number[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Second(),
                    ),
                  );
                },
                child: const Text("second")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
