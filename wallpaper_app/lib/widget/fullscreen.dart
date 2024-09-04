import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key, required this.imageList});

  final String imageList;

  @override
  State<FullScreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<FullScreen> {
  Future<void> setWallpaper(BuildContext context, int location) async {
    // int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageList);
    bool fileInfo =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    if (fileInfo) {
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              widget.imageList,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () => setWallpaperOptions(context),
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text('Set Wallpaper',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
