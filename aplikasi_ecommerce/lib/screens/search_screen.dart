import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Skincare'),
        backgroundColor: Colors.blue, // Blue for the AppBar
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Search with a more modern and clean design
            TextField(
              decoration: InputDecoration(
                hintText: 'Search skincare products...',
                hintStyle: TextStyle(
                    color: Colors.blue[600]), // Lighter blue for hint text
                prefixIcon: const Icon(Icons.search,
                    color: Colors.blue), // Blue search icon
                filled: true,
                fillColor: Colors.white, // White background for input field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                  borderSide: BorderSide.none, // Remove default border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2), // Blue border on focus
                ),
              ),
              onChanged: (value) {
                // Add search logic here
              },
            ),
            const SizedBox(height: 20),
            // Display search results using Card for a more stylish look
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual search result count
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5, // Card shadow effect
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/skincare_product.jpg'), // Replace with product image
                      ),
                      title: Text(
                        'Skincare Facial Wash ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87, // Black text for title
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text(
                        'Hydrating & Gentle Formula',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.blueAccent, // Blue icon for forward arrow
                      ),
                      onTap: () {
                        // Handle click action here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Clicked on Product ${index + 1}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
