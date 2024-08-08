import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
List images = [];
    @override
  void initState(){
    super.initState();
    fetchtheapi();
  }
  fetchtheapi() async {
    await https.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              'TyVyqPegTtrdJRA3yoUbHopZyhdd1gPF1HTcPbrME0tM2XGhqevWvJw0'
        }).then(
      (value) {
        Map result = jsonDecode(value.body);
        setState(() {
          images = result['photos'];
        });
        print(images);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {},
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 0, 0),
                            Color.fromARGB(255, 255, 125, 0),
                            Color.fromARGB(255, 0, 255, 0),
                            Color.fromARGB(255, 0, 255, 125),
                            Color.fromARGB(255, 0, 0, 255),
                            Color.fromARGB(255, 0, 125, 255),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network('src'),
                  ),
                ),
                itemCount: 100000,
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: const Center(
              child: Text(
                'Load More..',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
