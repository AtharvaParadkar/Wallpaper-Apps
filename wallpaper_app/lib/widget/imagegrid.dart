import 'package:flutter/material.dart';
import 'package:wallpaper_app/widget/fullscreen.dart';

class Imagegrid extends StatefulWidget {
  const Imagegrid({super.key, required this.imageList});

  final List<String> imageList;

  @override
  State<Imagegrid> createState() => _ImagegridState();
}

class _ImagegridState extends State<Imagegrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1 / 2.1,
      ),
      itemCount: widget.imageList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FullScreen(imageList: widget.imageList[index],),
              ),
            );
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.network(
              widget.imageList[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
