//?Pexels Api
//? TyVyqPegTtrdJRA3yoUbHopZyhdd1gPF1HTcPbrME0tM2XGhqevWvJw0

import 'package:flutter/material.dart';
import 'package:wallpaper_app_api/wallpaper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const Wallpaper(),
    );
  }
}
