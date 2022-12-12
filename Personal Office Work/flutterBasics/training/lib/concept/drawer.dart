import 'package:flutter/material.dart';

class DrawerSamples extends StatefulWidget {
  const DrawerSamples({Key? key}) : super(key: key);

  @override
  State<DrawerSamples> createState() => _DrawerSamplesState();
}

class _DrawerSamplesState extends State<DrawerSamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DrawerSamples"),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Drawer Headers"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Personal"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
