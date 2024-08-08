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
  int page = 1;
  @override
  void initState() {
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
      },
    );
  }

  loadmore() async {
    setState(() {
      page += 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
    await https.get(Uri.parse(url), headers: {
      'Authorization':
          'TyVyqPegTtrdJRA3yoUbHopZyhdd1gPF1HTcPbrME0tM2XGhqevWvJw0'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
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
              padding: const EdgeInsets.all(9),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {},
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      images[i]['src']['tiny'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                itemCount: images.length,
              ),
            ),
          ),
          InkWell(
            onTap: () => loadmore(),
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Load More..',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
