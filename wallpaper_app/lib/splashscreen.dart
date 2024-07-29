import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/widget/tabbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const TabbarWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.purpleAccent,
              Colors.green,
              Colors.grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/wallpaper.jpg'),
        ),
      ),
    );
  }
}
