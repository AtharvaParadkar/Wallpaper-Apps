import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class Fullscreen extends StatefulWidget {
  const Fullscreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  Future<void> setWallpaper(BuildContext context,int location) async {
    // int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wallpaper set successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to set wallpaper.')),
      );
    }
  }

  Future<void> setWallpaperOptions(BuildContext content) async {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        width: double.infinity,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.grey,
              onTap: () {
                setWallpaper(context, WallpaperManager.HOME_SCREEN);
                Navigator.pop(context);
              },
              child: const Center(
                child: Text('Home Screen',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            InkWell(
              splashColor: Colors.grey,
              onTap: () {
                setWallpaper(context, WallpaperManager.LOCK_SCREEN);
                Navigator.pop(context);
              },
              child: const Center(
                child: Text('Lock Screen',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            InkWell(
              splashColor: Colors.grey,
              onTap: (){
                setWallpaper(context, WallpaperManager.BOTH_SCREEN);
                Navigator.pop(context);
              },
              child: const Center(
                child: Text('Both Screens',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(widget.imageUrl),
          ),
          InkWell(
            onTap: () => setWallpaperOptions(context),
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black12,
              child: const Center(
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
