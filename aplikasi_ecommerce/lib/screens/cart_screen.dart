import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Ini adalah halaman favorite')),
    );
  }
}