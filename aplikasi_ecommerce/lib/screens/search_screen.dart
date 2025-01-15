import 'package:flutter/material.dart';
import 'package:aplikasi_ecommerce/data/home_data.dart';
import 'package:aplikasi_ecommerce/models/home.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'All';
  String searchQuery = '';

  final List<String> categories = [
    'All',
    'Sunscreen',
    'Moisturizer',
    'Lotion',
    'Serum',
    'Mask'
  ];

  // Example product data
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Skintific Brightening Serum',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe8_ENcHPuulBp0h58ye1qwWhS2vfZ5tAPHw&s',
      'price': 23.00,
      'category': 'Serum'
    },
    {
      'name': 'Skintific Exfoliating Lotion',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTa8PIi5PhOH_YpfFbwKHUOaIbSxcoEzOh2A&s',
      'price': 15.00,
      'category': 'Lotion'
    },
    {
      'name': 'Retinol Moisturizer',
      'imageUrl':
        'data:image/jpeg;base64,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',
        'price': 15.00,
      'category': 'Moisturizer',
    },
    {
      'name': 'Sunscreen SPF 50',
      'imageUrl':
        'data:image/jpeg;base64,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',
      'price': 100000.0,
    'category': 'Sunscreen',
    },
    {
     'name': 'Skintific Mugwort Mask',
    'imageUrl':
        'data:image/jpeg;base64,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',
    'price': 90000.0,
    'category': 'Mask',
    },
    {
      'name': 'Acne Moisturizer',
    'imageUrl':
        'data:image/jpeg;base64,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',
     'price': 90000.0,
    'category': 'Moisturizer',
    }


  ];

  @override
  Widget build(BuildContext context) {
    // Filter products based on category and search query
    final filteredProducts = products.where((product) {
      final matchesCategory =
          selectedCategory == 'All' || product['category'] == selectedCategory;
      final matchesQuery =
          product['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          // Category Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Product List
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product['imageUrl'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${product['price'].toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

