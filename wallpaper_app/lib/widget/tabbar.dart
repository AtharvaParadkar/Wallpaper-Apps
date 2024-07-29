import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widget/imagegrid.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
      );
  }
}