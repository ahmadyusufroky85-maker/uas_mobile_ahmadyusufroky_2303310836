import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS Mobile Ahmad',
      // Gunakan colorScheme agar sesuai dengan standar Material 3
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Tambahkan fontFamily jika Anda sudah mendaftarkan font di pubspec.yaml
        // fontFamily: 'MyNotoFont',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
