import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridviewWidgets extends StatefulWidget {
  const GridviewWidgets({Key? key}) : super(key: key);

  @override
  State<GridviewWidgets> createState() => _GridviewWidgetsState();
}

class _GridviewWidgetsState extends State<GridviewWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.brown,
                      height: 90,
                      width: 85,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.food_bank,
                              size: 60,
                            ),
                            Container(
                              height: 20,
                              width: 80,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  "Data",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
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
