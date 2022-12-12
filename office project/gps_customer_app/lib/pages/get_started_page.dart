import 'package:flutter/material.dart';
import 'package:gps_customer_app/pages/login_page.dart';

import 'common_widget_functions/page_Containers.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  double width = 0.0;
  double height = 0.0;
  PageContainers pages = PageContainers();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            pages.pageContainer(1),
            splashImage(),
            descriptionTextWidget(),
            const SizedBox(
              height: 30,
            ),
            getStartButton(context),
          ],
        ),
      ),
    );
  }

  splashImage() {
    return Column(
      children: const [
        SizedBox(
          height: 90,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image(
            image: AssetImage('assets/splash_image/splash.png'),
            height: 170,
          ),
        ),
      ],
    );
  }

  descriptionTextWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Let’s Go Started",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text:
                        "Golden Professional Services is your one-sep destination local services.Get donzens",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 17)),
                TextSpan(
                  text:
                      'of trusted professionals near you to take care of all your home and beauty ...',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 17),
                )
              ])),
        ),
      ],
    );
  }

  getStartButton(context) {
    width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 2.2,
      height: 45,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
