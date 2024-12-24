import 'package:flutter/material.dart';
import 'Login_page.dart'; // Import your LoginPage

void main() {
  runApp(const MyApp());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Set LoginPage as the home
    );
  }
}
