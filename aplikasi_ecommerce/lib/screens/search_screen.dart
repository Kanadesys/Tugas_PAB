import 'package:flutter/material.dart';

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
    'Cream',
    'Moisturizers',
    'Lotion',
    'Serum',
    'Spray'
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
