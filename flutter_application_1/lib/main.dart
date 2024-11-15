import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/sc_data.dart'; // Pastikan data skincare sudah sesuai
import 'package:flutter_application_1/screens/detail_screen.dart'; // Halaman detail skincare
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
      title: 'Skincare App',  // Ubah judul aplikasi menjadi Skincare
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.green),  // Ubah warna icon menjadi hijau
          titleTextStyle: TextStyle(
            color: Colors.green,  // Sesuaikan dengan tema hijau
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(  // Ubah tema warna menggunakan hijau
          primary: Colors.green,
          surface: Colors.green[50],  // Warna latar belakang yang lebih terang
        ),
        useMaterial3: true,
      ),
      // Ganti home menjadi halaman detail skincare
      home: DetailScreen(
        skincare: skincareList[0],  // Pastikan data skincare sesuai
      ),
      // Jika Anda ingin mengganti dengan halaman profil atau login, bisa diubah di sini
      // home: ProfileScreen(),
      // home: SignInScreen(),
    );
  }
}
