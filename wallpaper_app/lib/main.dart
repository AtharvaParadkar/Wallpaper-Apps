import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widget/imagegrid.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 0, 0, 0),
  ),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            title: const Text('Wallpapers'),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'HOME'),
                Tab(text: 'AI ARTIST'),
                Tab(text: 'ANIME'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Imagegrid(imageList: homeImageUlrs),
              Imagegrid(imageList: aiImageUrls),
              Imagegrid(imageList: animeImageUrls),
            ],
          ),
        ),
      ),
    );
  }
}
