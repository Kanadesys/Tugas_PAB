import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/sc_data.dart'; // Mengimpor data skincare
import 'package:flutter_application_1/screens/detail_screen.dart'; // Halaman detail produk skincare
import 'package:flutter_application_1/screens/profile_screen.dart'; // Halaman profil pengguna
import 'package:flutter_application_1/screens/signin_screen.dart'; // Halaman login/sign-in

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skincare App',  // Mengubah judul aplikasi menjadi "Skincare App"
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.green),  // Mengubah warna ikon menjadi hijau
          titleTextStyle: TextStyle(
            color: Colors.green,  // Mengubah warna teks di appBar menjadi hijau
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(  // Menggunakan warna hijau untuk tema
          primary: Colors.green,
          surface: Colors.green[50],  // Warna latar belakang yang lebih terang
        ),
        useMaterial3: true,
      ),
      // Ganti home untuk menampilkan detail skincare pertama
      home: DetailScreen(
        skincare: skincareList[0],  // Mengubah menjadi list skincare
      ),
      // Jika Anda ingin menggunakan halaman profil atau login, Anda bisa mengubahnya di sini
      // home: ProfileScreen(),
      // home: SignInScreen(),
    );
  }
}
