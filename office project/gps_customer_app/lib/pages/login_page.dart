import 'package:flutter/material.dart';
import 'common_widget_functions/page_Containers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double width = 0.0;
  double height = 0.0;

  bool colorActive = true;

  PageContainers pages = PageContainers();

  final formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              pages.pageContainer(2),
              phoneImage(),
              descriptionTextWidget(),
              const SizedBox(
                height: 15,
              ),
              containerDetails(),
              const SizedBox(
                height: 15,
              ),
              additionalDetails(),
            ],
          ),
        ),
      ),
    );
  }

  phoneImage() {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image(
            image: AssetImage('assets/splash_image/iPhone.png'),
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
          height: 20,
        ),
        const Text(
          "Login With Mobile Number / Email ID",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Enter your mobile number / Email ID we will sent ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 17),
                  ),
                  TextSpan(
                    text: 'your OTP verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  containerDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: height / 3,
      width: width / 1.2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (colorActive == true) {
                                colorActive = false;
                              }
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorActive != true
                                  ? Colors.white
                                  : Colors.indigo,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "EMAIL",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colorActive != true
                                      ? Colors.indigo
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (colorActive == false) {
                                colorActive = true;
                              }
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorActive == true
                                  ? Colors.white
                                  : Colors.indigo,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "PHONE",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colorActive == true
                                      ? Colors.indigo
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                colorActive == false
                    ? textFormFieldEmail()
                    : textFormFieldPhone(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? numberChoose;
  List listNumbers = ['+91', '100'];

  textFormFieldPhone() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              DropdownButton<String>(
                value: numberChoose,
                items: listNumbers.map((items) {
                  return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                        items,
                      ));
                }).toList(),
                onChanged: (numberValue) {
                  setState(() {
                    numberChoose = numberValue;
                  });
                },
              ),
              SizedBox(
                width: 10,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Text(
                "|",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    hintText: "Enter your mobile number",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  textFormFieldEmail() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "Enter your Email",
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }

  additionalDetails() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'By continuing, you agree with our ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 14),
                ),
              ),
              InkWell(
                onTap: () {},
                child: RichText(
                  text: const TextSpan(
                    text: 'Teams & Conditions',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(text: ' and '),
              ),
              InkWell(
                onTap: () {},
                child: RichText(
                  text: const TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
