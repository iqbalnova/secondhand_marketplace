import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class FullscreenImageScreen extends StatefulWidget {
  final String imagePath;
  final List<String> imgList;
  final int initialPage;

  const FullscreenImageScreen({
    Key? key,
    required this.imagePath,
    required this.imgList,
    required this.initialPage,
  }) : super(key: key);

  @override
  State<FullscreenImageScreen> createState() => _FullscreenImageScreenState();
}

class _FullscreenImageScreenState extends State<FullscreenImageScreen> {
  late int currentIndex = widget.initialPage;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context, currentIndex),
        child: Container(
          decoration: BoxDecoration(color: blackColor),
          child: Hero(
            tag: widget.imagePath,
            child: Center(child: buildImageSlider()),
          ),
        ),
      ),
    );
  }

  Widget buildImageSlider() {
    return PhotoViewGallery(
      pageController: PageController(initialPage: currentIndex),
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: const BoxDecoration(
        color: Colors.black,
      ),
      pageOptions: widget.imgList
          .map((item) => PhotoViewGalleryPageOptions(
                imageProvider: FileImage(File(item)),
                basePosition: Alignment.center,
              ))
          .toList(),
      onPageChanged: onPageChanged,
    );
  }
}
