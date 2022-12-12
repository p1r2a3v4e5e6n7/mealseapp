import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'get_started_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageNavigator();
  }

  pageNavigator() {
    return Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const GetStarted())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/splash_image/splash.png'),
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
