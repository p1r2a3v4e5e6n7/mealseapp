import 'package:flutter/material.dart';

class ImageContantWidget extends StatefulWidget {
  const ImageContantWidget({Key? key}) : super(key: key);

  @override
  State<ImageContantWidget> createState() => _ImageContantWidgetState();
}

class _ImageContantWidgetState extends State<ImageContantWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shadowColor: Colors.blueGrey,
                  elevation: 4,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          child: const Image(
                            image: AssetImage("assets/image 1 (1).png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Aluminum Work",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Starts from Rs.120",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Get 40% off on first service",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
