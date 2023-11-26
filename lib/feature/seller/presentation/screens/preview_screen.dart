import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/core/presentation/widgets/header_profile_widget.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/widgets/build_info_product.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class PreviewScreen extends StatefulWidget {
  final List<String> imgList;
  final String category;
  final String productName;
  final String price;
  final String description;

  const PreviewScreen({
    Key? key,
    required this.imgList,
    required this.category,
    required this.productName,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(''),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildImageCarousel(),
                _buildProductInfo(),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(14.0),
          margin: EdgeInsets.symmetric(vertical: 20.h),
          child: CustomButton(onTap: () {}, label: 'Terbitkan'),
        ),
      ],
    );
  }

  Widget _buildImageCarousel() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          items: _buildImageSliders(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 11,
            viewportFraction: 1,
            initialPage: _current,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 60,
          left: 0.0,
          right: 0.0,
          child: _buildIndicatorRow(),
        ),
        Positioned(
          bottom: -60,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: BuildInfoProduct(
              category: widget.category,
              productName: widget.productName,
              price: widget.price,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildImageSliders() {
    return widget.imgList.map((item) {
      return GestureDetector(
        onTap: () => _showFullscreenImage(context, item),
        child: Hero(
          tag: item, // Unique tag for each image
          child: _buildImageSliderItem(item),
        ),
      );
    }).toList();
  }

  Widget _buildImageSliderItem(String item) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Image.file(
        File(item),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 500,
      ),
    );
  }

  Widget _buildIndicatorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildIndicatorWidgets(),
    );
  }

  List<Widget> _buildIndicatorWidgets() {
    return widget.imgList.asMap().entries.map((entry) {
      return GestureDetector(
        onTap: () => _controller.animateToPage(entry.key),
        child: _buildIndicatorDot(entry.key),
      );
    }).toList();
  }

  Widget _buildIndicatorDot(int index) {
    return Container(
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(_current == index ? 0.9 : 0.4),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          const SizedBox(height: 76),
          const HeaderInfoProfile(name: 'Messi', city: 'Barcelona'),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: blackTextStyle,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.description,
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff8A8A8A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showFullscreenImage(BuildContext context, String imagePath) async {
    Navigator.pushNamed(
      context,
      AppRoutes.imageFullScreen,
      arguments: {
        'imagePath': imagePath,
        'imgList': widget.imgList,
        'initialPage': _current,
      },
    );
  }
}
