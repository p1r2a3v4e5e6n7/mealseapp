import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_controller/test_controller.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _testName = TextEditingController();

  late Future<List<String>> _loadData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData =
          Provider.of<TestApp>(context, listen: false).funList("Submit");
    });
  }

  @override
  Widget build(BuildContext context) {
    // _loadData = Provider.of<TestApp>(context, listen: false).funList("Submit");
    return Scaffold(body: Consumer<TestApp>(
      builder: (context, test, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _testName,
            ),
            test.namesListData.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: test.namesListData.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          onPressed: () {
                            test.funList(_testName.text);
                            _testName.clear();
                          },
                          child: Text(test.namesListData[index]));
                    })
                : ElevatedButton(
                    onPressed: () {
                      test.funList(_testName.text);
                    },
                    child: const Text("Submit")),
          ],
        );
      },
    ));
  }
}
