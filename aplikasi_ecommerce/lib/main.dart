import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:aplikasi_ecommerce/screens/home_screen.dart';
import 'package:aplikasi_ecommerce/screens/cart_screen.dart';
import 'package:aplikasi_ecommerce/screens/profile_screen.dart';
import 'package:aplikasi_ecommerce/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _selectedIndex = 1;
  int _currentCarouselIndex = 0;
  final CarouselSliderController carouseSliderlController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Carousel Section
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouseSliderlController,
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
                  _buildNavButton(context, 'Facial Wash', const HomeScreen()),
                  _buildNavButton(context, 'Moisturizer', const HomeScreen()),
                  _buildNavButton(context, 'Essence', const HomeScreen()),
                  _buildNavButton(context, 'Serum', const HomeScreen()),
                ],
              ),
            ),

            // Products Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 8, // Number of products
                itemBuilder: (context, index) {
                  return _buildProductCard();
                },
              ),
            ),
          ],
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Update the displayed page based on selected index
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

  Widget _buildNavButton(BuildContext context, String text, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navigate to the selected screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
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

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 32, 32, 32).withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage('images/cosrx.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'COSRX',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Advanced Snail Mucin 96 Power Essence',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'IDR 3,000,000',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
