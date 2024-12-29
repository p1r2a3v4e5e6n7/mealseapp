import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/product_details.dart';

import '../models/prodect_model.dart';
import '../provider_mange/prodectList_provider.dart';

class ProdectListScreen extends StatefulWidget {
  @override
  State<ProdectListScreen> createState() => _ProdectListScreenState();
}

class _ProdectListScreenState extends State<ProdectListScreen> {
  final List<String> shoeImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTee5StRsfCFyLB-nKbPUIjPC6q5vxAxKQv1w&s',
  ];
  // late ProviderList providerList;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     providerList = Provider.of<ProviderList>(context, listen: false);
  //
  //     providerList.fetchProductListData();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final providerList = Provider.of<ProviderList>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Footwear Elegance\nCollection',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Men Shoes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      top: 200,
                      bottom: 0,
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder<List<ShoeList>>(
                            future: providerList.fetchProductListData(),
                            builder: (context, snapshot) {
                              // if (snapshot.connectionState ==
                              //     ConnectionState.waiting) {
                              //   return const Center(
                              //       child: CircularProgressIndicator());
                              // } else
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No products available.'));
                              }

                              final products = snapshot.data!;

                              return Consumer<ProviderList>(
                                builder: (context, providerList, child) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      final product = products[index];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => DetailScreen(
                                                    products: products[index]),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Image.network(
                                                        product.image,
                                                        height: 150,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return const Icon(
                                                              Icons.error);
                                                        },
                                                      ),
                                                      const Positioned(
                                                        top: 5,
                                                        right: 5,
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Men\'s Running',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '\$${product.price.toStringAsFixed(2)}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      const Text(
                                                        'Colors',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        radius: 7,
                                                      ),
                                                      const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.black,
                                                        radius: 7,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Latest Shoes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Show all',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoeImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              shoeImages[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            elevation: 0,
            mouseCursor: SystemMouseCursors.grab,
            selectedIconTheme:
                const IconThemeData(color: Colors.white, size: 35),
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: 0,
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            unselectedItemColor: Colors.black,
            onTap: (v) {},
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        )

        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.black,
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.black,
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       label: 'Search',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.favorite_border),
        //       label: 'Favorite',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     ),
        //   ],
        // ),
        );
  }
}
