import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:aplikasi_ecommerce/data/home_data.dart';
import 'package:aplikasi_ecommerce/models/home.dart';
import 'package:aplikasi_ecommerce/screens/cart_screen.dart';
import 'package:aplikasi_ecommerce/screens/profile_screen.dart';
import 'package:aplikasi_ecommerce/screens/search_screen.dart';
import 'package:aplikasi_ecommerce/screens/detail_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  int _selectedIndex = 1;
  int _currentCarouselIndex = 0;

  // Filter skincare products
  List<SkincareProduct> get filteredProducts {
    if (selectedCategory == 'All') {
      return skincareList;
    }
    return skincareList
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // SEARCH BAR
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         hintText: 'Search products...',
              //         prefixIcon: const Icon(Icons.search, color: Colors.grey),
              //         border: InputBorder.none,
              //         contentPadding: const EdgeInsets.symmetric(
              //           horizontal: 16.0,
              //           vertical: 12.0,
              //         ),
              //         suffixIcon: IconButton(
              //           icon: const Icon(Icons.clear, color: Colors.grey),
              //           onPressed: () {},
              //         ),
              //       ),
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const SearchScreen()),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),

              // "Today's Offer" Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Today's Offer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentCarouselIndex = index;
                          });
                        },
                      ),
                      items: List.generate(4, (index) {
                        final colors = [
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                          Colors.purple,
                        ];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: 4,
                        position: _currentCarouselIndex,
                        decorator: const DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.black,
                          size: Size.square(8.0),
                          activeSize: Size.square(8.0),
                          spacing: EdgeInsets.all(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton(context, 'All'),
                    _buildNavButton(context, 'Serum'),
                    _buildNavButton(context, 'Moisturizer'),
                    _buildNavButton(context, 'Sunscreen'),
                    _buildNavButton(context, 'Night Cream'),
                    _buildNavButton(context, 'Mask')
                  ],
                ),
              ),

              // "Popular This Week" Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Popular This Week",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // produk builder
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(filteredProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Navigate to the selected screen
          if (_selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          } else if (_selectedIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          } else if (_selectedIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text; // Update the selected category
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCategory == text ? Colors.blue[100] : Colors.grey[200],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // GRID PRODUK
  Widget _buildProductCard(SkincareProduct product) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailScreen when the product is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(skincareProduct: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 236, 236, 236),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GAMBARRR PRODUKKKKKKKKKKKKK
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover, // Make sure the image fits properly
                ),
              ),
            ),

            // DETAIL PRODUKKKKKKKKKKKKK
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'IDR ${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
