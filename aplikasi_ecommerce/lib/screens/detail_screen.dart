import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/models/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi_ecommerce/screens/cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final SkincareProduct skincareProduct;
  const DetailScreen({super.key, required this.skincareProduct});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];
    setState(() {
      _isFavorite = favoriteHomes.contains(widget.skincareProduct.name);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];

    setState(() {
      if (_isFavorite) {
        // Process unfavorite
        favoriteHomes.remove(widget.skincareProduct.name);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${widget.skincareProduct.name} removed from favorites')));
      } else {
        favoriteHomes.add(widget.skincareProduct.name);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${widget.skincareProduct.name} added to favorites')));
      }
    });

    await prefs.setStringList('favoriteHomes', favoriteHomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---------------- ATAS ------------------
              Stack(
                children: [
                  // Image Utama
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.skincareProduct.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  // Tombol Back
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Goes back to HomeScreen
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Product Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Product Title and Favorite Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.skincareProduct.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: Icon(_isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: _isFavorite ? Colors.red : null,
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Product Info: Category, Price, and Description
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Category',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.skincareProduct.category}')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Price',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.skincareProduct.price}')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.description,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Desc',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.skincareProduct.description}')
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    // Product Description
                    Text(
                      widget.skincareProduct.description,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      thickness: 1,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
