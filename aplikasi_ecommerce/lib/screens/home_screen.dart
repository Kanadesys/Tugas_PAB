// import 'package:flutter/material.dart';
// import 'package:aplikasi_ecommerce/data/home_data.dart';
// import 'package:aplikasi_ecommerce/models/home.dart';
// import 'package:aplikasi_ecommerce/screens/detail_screen.dart';
// import 'package:aplikasi_ecommerce/screens/favorite_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             child: ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const FavoriteScreen()));
//                 },
//                 label: const Text('Favorite'),
//                 icon: const Icon(Icons.favorite)),
//           )
//         ],
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
//               padding: const EdgeInsets.all(8),
//               itemCount: skincareList.length,
//               itemBuilder: (context, index) {
//                 SkincareProduct skincareProduct = skincareList[index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 DetailScreen(skincareProduct: skincareProduct)));
//                   },
//                   child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16)),
//                       margin: const EdgeInsets.all(6),
//                       elevation: 1,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // Gambar Tempat
//                           Expanded(
//                               child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.asset(
//                               skincareProduct.imageAsset,
//                               fit: BoxFit.cover,
//                             ),
//                           )),
//                           // Nama Tempat
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16, top: 8),
//                             child: Text(
//                               skincareProduct.name,
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           // Lokasi Tempat
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16, bottom: 8),
//                             child: Text(
//                               skincareProduct.description,
//                               style: const TextStyle(fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       )),
//                 );
//               },
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/data/home_data.dart';
import 'package:aplikasi_ecommerce/models/home.dart';
import 'package:aplikasi_ecommerce/screens/detail_screen.dart';
import 'package:aplikasi_ecommerce/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Skincare Lab'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header dengan ikon menu
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Aksi untuk ikon menu
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menu tapped!')),
                      );
                    },
                    child: Icon(
                      Icons.sort_rounded,
                      color: Colors.blue[900],
                      size: 28,
                    ),
                  ),
                  const Text(
                    'Facial Wash',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.blue[900],
                    size: 28,
                  ),
                ],
              ),
            ),
            // Tab Bar
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue[900],
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Home'),
                Tab(text: 'Categories'),
                Tab(text: 'Favorites'),
                Tab(text: 'Profile'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildHomeContent(),
                  _buildCategoriesContent(),
                  _buildFavoritesContent(),
                  _buildProfileContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Featured Products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 4, // Ganti dengan jumlah produk aktual
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMjgIF3hq_s9D9Wrt0RZ20Dq29AMBDl4oG2w&s', // Ganti dengan path gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Skintific Panthenol Facial Wash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Rp. 150.000',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoriesContent() {
    return const Center(
      child: Text('Categories content goes here'),
    );
  }

  Widget _buildFavoritesContent() {
    return const Center(
      child: Text('Favorites content goes here'),
    );
  }

  Widget _buildProfileContent() {
    return const Center(
      child: Text('Profile content goes here'),
    );
  }
}
