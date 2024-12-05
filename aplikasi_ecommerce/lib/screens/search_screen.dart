import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Ini adalah halaman search')),
    );
  }
}