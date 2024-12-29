import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/list_provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
