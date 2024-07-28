import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key, required this.imageList});

  final String imageList;

  @override
  State<FullScreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<FullScreen> {
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
              onTap: () {},
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
