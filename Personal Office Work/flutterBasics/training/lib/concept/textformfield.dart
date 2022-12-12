import 'package:flutter/material.dart';

class TextFormFieldsCode extends StatefulWidget {
  const TextFormFieldsCode({Key? key}) : super(key: key);

  @override
  State<TextFormFieldsCode> createState() => _TextFormFieldsCodeState();
}

class _TextFormFieldsCodeState extends State<TextFormFieldsCode> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _oneController = TextEditingController();
  final TextEditingController _twoController = TextEditingController();
  final TextEditingController _threeController = TextEditingController();
  final TextEditingController _fourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _oneController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (_) => (_oneController.text.isEmpty)
                              ? FocusScope.of(context).nextFocus()
                              : FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _twoController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (_) => _twoController.text.isEmpty
                              ? FocusScope.of(context).nextFocus()
                              : FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _threeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (_) => _threeController.text.isEmpty
                              ? FocusScope.of(context).nextFocus()
                              : FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _fourController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (_) => _fourController.text.isEmpty
                              ? FocusScope.of(context).nextFocus()
                              : FocusScope.of(context).nextFocus(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
