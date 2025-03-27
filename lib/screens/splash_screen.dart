import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ED5),
      body: Center(
        child: Image.asset("lib/assets/pictures/BinusLite Logo NoBack.png")
      ),
    );
  }
}
