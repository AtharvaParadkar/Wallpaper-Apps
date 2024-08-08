import 'package:flutter/material.dart';

class Fullscreen extends StatefulWidget {
  const Fullscreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(widget.imageUrl),
          ),
          InkWell(
            onTap: () {},
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
