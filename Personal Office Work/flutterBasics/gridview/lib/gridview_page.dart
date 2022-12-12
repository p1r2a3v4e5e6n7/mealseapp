import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 15,
                      width: 7.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((100))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("sample"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
