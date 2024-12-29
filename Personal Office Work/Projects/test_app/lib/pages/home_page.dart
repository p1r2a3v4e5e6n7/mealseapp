import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/main.dart';
import 'package:test_app/provider_controller/test_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> providerList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // providerList = Future.value([]);
    MyApp.data.getFun();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      providerList =
          Provider.of<TestProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app'),
      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          return FutureBuilder<void>(
              future: providerList,
              builder: (context, snaData) {
                if (snaData.hasError) {
                  return Center(child: Text('Error: ${snaData.error}'));
                }
                final tasks = testProvider.listData;
                if (tasks.isEmpty) {
                  return const Center(child: Text('No tasks available.'));
                }
                return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var listData = tasks[index];
                      return ListTile(
                        title: Text(listData.toString()),
                      );
                    });
              });
        },
      ),
    );
  }
}
