import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/data/home_data.dart';
import 'package:aplikasi_ecommerce/models/home.dart';
import 'package:aplikasi_ecommerce/screens/detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<SkincareProduct> _favoriteProducts = [];

  Future<void> _loadFavoriteProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteProductNames =
        prefs.getStringList('favoriteProducts') ?? [];

    setState(() {
      _favoriteProducts = skincareList
          .where((product) => favoriteProductNames.contains(product.name))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Skincare')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: skincareList.length,
                itemBuilder: (context, index) {
                  SkincareProduct skincareProduct = skincareList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(skincareProduct: skincareProduct),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.all(6),
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Gambar Produk
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                skincareProduct.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Nama Produk
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              skincareProduct.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Kategori Produk
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Text(
                              skincareProduct.category,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
