import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/test_model.dart';

import '../shared_profreance/shared_profrance_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  bool valueValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode:
              valueValid == false ? null : AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Required Email';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _phone,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Required phone';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(onPressed: login, child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      SharedData data = SharedData();
      var logData = TestModel(mail: _email.text, phone: _phone.text);
      await data.setFun(logData);
      await data.getFun();
      if (MyApp.testData != null) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } else {
        print("object");
      }
    } else {
      setState(() {
        valueValid = true;
      });
    }
  }
}
