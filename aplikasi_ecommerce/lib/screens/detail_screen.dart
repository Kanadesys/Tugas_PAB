import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/models/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    List<String> favoriteProducts = prefs.getStringList('favoriteProducts') ?? [];
    setState(() {
      _isFavorite = favoriteProducts.contains(widget.skincareProduct.name);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteProducts = prefs.getStringList('favoriteProducts') ?? [];

    setState(() {
      if (_isFavorite) {
        favoriteProducts.remove(widget.skincareProduct.name);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${widget.skincareProduct.name} removed from favorites')));
      } else {
        favoriteProducts.add(widget.skincareProduct.name);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${widget.skincareProduct.name} added to favorites')));
      }
    });

    await prefs.setStringList('favoriteProducts', favoriteProducts);
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
                      placeholder: (context, url) => Transform.scale(
                        scale: 0.2,
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Tombol Back
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                )
              ],
            ),
            const SizedBox(height: 16),
            // Di bawahnya Image Utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Judul
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
                  // Info lainnya
                  Row(
                    children: [
                      const Icon(
                        Icons.category,
                        color: Colors.purple,
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text('Kategori',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(': ${widget.skincareProduct.category}')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text('Harga',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(': Rp ${widget.skincareProduct.price}')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: Colors.deepPurple.shade100,
                    thickness: 1,
                  ),
                  const SizedBox(height: 16),
                  // Deskripsi
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
      )),
    );
  }
}