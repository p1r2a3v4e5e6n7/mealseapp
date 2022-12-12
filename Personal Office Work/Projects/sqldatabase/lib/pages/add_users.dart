import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../comman_widget/colors.dart';
import '../comman_widget/validator.dart';
import '../main.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  Validator validator = Validator();

  double width = 0.0;
  double height = 0.0;
  bool isLock = false;
  double fixPadding = 10;

  apiFunction() async {
    if (!isLock) {
      isLock = true;
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      });
      isLock = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _widgetFunction(),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 43,
                ),
                continueButton(),
              ],
            )),
      ),
    );
  }

  _widgetFunction() {
    return Form(
      key: validator.formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 1,
                    right: 1,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: hexblueColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: hexblueColor,
                                      // color: grayLinear,
                                    ),
                                    child: TextFormField(
                                        controller: nameController,
                                        validator: validator.validateName,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Enter the name',
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 19))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: hexblueColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: hexblueColor,
                                    ),
                                    child: TextFormField(
                                      controller: emailController,
                                      validator: validator.validateEmail,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Enter the Email',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 19),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  continueButton() {
    return SizedBox(
      height: height / 17,
      width: width / 1.2,
      child: InkWell(
        onTap: () {
          validator.validate();
          if (validator.validate()) {
            apiFunction();
            FocusScope.of(context).unfocus();
          }
        },
        child: Container(
          padding: EdgeInsets.all(fixPadding * 1.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: verifyButtoncolor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'Add User',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
