import 'package:flutter/material.dart';
import 'dart:async';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer 5 detik
    Timer(const Duration(seconds: 5), () {
      // Navigasi ke MainScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan warna background
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
        ), // Path harus sesuai pubspec.yaml
      ),
    );
  }
}
