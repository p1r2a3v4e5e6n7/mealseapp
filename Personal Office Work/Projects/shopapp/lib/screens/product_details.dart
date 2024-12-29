// import 'package:flutter/material.dart';
//
// import '../models/prodect_model.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final ShoeList products;
//   ProductDetailsScreen({Key? key, required this.products}) : super(key: key);
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   List<int> sizeNumbers = [38, 39, 40, 41, 42, 43];
//   int? selectedSize;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: Text(widget.products.name),
//           actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))]),
//       body: Column(children: [
//         imageWidgets(),
//         containWidgets(),
//       ]),
//       bottomNavigationBar: Container(
//           width: 350,
//           child: ElevatedButton(
//             onPressed: () {},
//             child: Text("Shop now"),
//           )),
//     );
//   }
//
//   Widget imageWidgets() {
//     return Image.network(
//       widget.products.image,
//       height: 50,
//       width: 50,
//     );
//   }
//
//   Widget containWidgets() {
//     return Expanded(
//         child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(widget.products.name),
//             Text(
//               widget.products.price.toString(),
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Men's",
//               style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "5.0",
//               style: TextStyle(
//                   fontSize: 7,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.amber),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "Select a Size",
//               style: TextStyle(
//                   fontSize: 7,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               "(view size guide)",
//               style: TextStyle(
//                   fontSize: 7,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey.shade100),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: sizeNumbers.map((size) {
//             bool isSelected = size == selectedSize;
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedSize = size;
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: isSelected ? Colors.black : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: isSelected ? Colors.blueAccent : Colors.grey,
//                   ),
//                 ),
//                 child: Text(
//                   size.toString(),
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "Descriptions",
//               style: TextStyle(
//                   fontSize: 7,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               "Details",
//               style: TextStyle(
//                   fontSize: 7,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Text(
//           widget.products.des,
//           style: TextStyle(
//               fontSize: 7,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey.shade100),
//         ),
//       ],
//     ));
//   }
// }
import 'package:flutter/material.dart';

import '../models/prodect_model.dart';
import '../widgets/image_sliders.dart';

class DetailScreen extends StatelessWidget {
  ShoeList? products;
  DetailScreen({this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(products!.name),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => [],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductSlider(images: [
            products!.image,
          ]),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products!.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${products!.price.toString()}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < 5 ? Colors.yellow : Colors.grey,
                            size: 20,
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      const Text('Men’s Running'),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Colors'),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 10,
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Select a Size'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '(view size guid)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          foregroundColor:
                              index == 2 ? Colors.white : Colors.black,
                          backgroundColor:
                              index == 2 ? Colors.black : Colors.grey[300],
                          shape: CircleBorder(),
                        ),
                        onPressed: () {},
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            (38 + index).toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Description'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Details'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Shop now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
