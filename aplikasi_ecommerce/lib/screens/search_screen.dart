import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Skincare'),
        backgroundColor: Colors.blue, // Warna yang lebih soft dan elegan
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Search dengan desain lebih elegan
            TextField(
              decoration: InputDecoration(
                hintText: 'Search skincare products...',
                hintStyle: TextStyle(color: Colors.grey[600]), // Warna hint lebih soft
                prefixIcon: Icon(Icons.search, color: Colors.pinkAccent), // Ikon pencarian yang lebih modern
                filled: true,
                fillColor: Colors.pink[50], // Background soft untuk input field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Border lebih membulat
                  borderSide: BorderSide.none, // Hapus border default
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.pinkAccent, width: 2), // Fokus border dengan warna pink
                ),
              ),
              onChanged: (value) {
                // Logika pencarian dapat ditambahkan di sini
              },
            ),
            const SizedBox(height: 20),
            // Hasil Pencarian menggunakan Card untuk tampil lebih menarik
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Ganti dengan jumlah hasil pencarian sebenarnya
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5, // Efek shadow pada card
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/skincare_product.jpg'), // Ganti dengan gambar produk
                      ),
                      title: Text(
                        'Skincare Facial Wash ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text(
                        'Hydrating & Gentle Formula',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.pinkAccent,
                      ),
                      onTap: () {
                        // Logika ketika item diklik
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Clicked on Product ${index + 1}')),
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
