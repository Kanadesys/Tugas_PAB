import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.blue, // Sesuaikan warna
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for items...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // Logika pencarian dapat ditambahkan di sini
              },
            ),
            const SizedBox(height: 20),
            // Bagian Hasil Pencarian
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Ganti dengan jumlah hasil pencarian sebenarnya
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text((index + 1).toString()),
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: const Text('Item description goes here'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Logika ketika item diklik
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Clicked on Item ${index + 1}')),
                      );
                    },
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
