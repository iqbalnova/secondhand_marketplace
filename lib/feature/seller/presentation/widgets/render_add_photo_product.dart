// ignore: file_names
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class RenderAddPhotoProduct extends StatefulWidget {
  final List<String> selectedPhotos;
  final Function(List<String>) onPhotosSelected;

  const RenderAddPhotoProduct({
    Key? key,
    required this.selectedPhotos,
    required this.onPhotosSelected,
  }) : super(key: key);

  @override
  State<RenderAddPhotoProduct> createState() => _RenderAddPhotoProductState();
}

class _RenderAddPhotoProductState extends State<RenderAddPhotoProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foto Produk',
            style: blackTextStyle,
          ),
          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          mainAxisExtent: 116.h,
        ),
        itemCount: widget.selectedPhotos.length + 1,
        itemBuilder: (context, index) {
          return _renderProductCell(index);
        },
      ),
    );
  }

  Widget _renderProductCell(int index) {
    if (index == widget.selectedPhotos.length) {
      return _renderAddPhoto();
    } else {
      return _renderMyProductPhoto(widget.selectedPhotos[index], index);
    }
  }

  Widget _renderAddPhoto() {
    return InkWell(
      onTap: _pickImages,
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color(0xffD0D0D0),
          dashPattern: const [6],
          strokeWidth: 1.0,
          radius: Radius.circular(12.r),
          child: Container(
            // height: 116.h,
            // width: 116.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: 24.sp,
                color: const Color(0xff8A8A8A),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderMyProductPhoto(String imagePath, int index) {
    return Stack(
      children: [
        Container(
          height: 116.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xffD0D0D0), width: 1.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            color: whiteColor,
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              _removeImage(index);
            },
          ),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await ImagePicker().pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        // Check the current count of selected photos
        final int currentCount = widget.selectedPhotos.length;
        final int remainingCount = 5 - currentCount;

        if (pickedFiles.length <= remainingCount) {
          setState(() {
            widget.selectedPhotos.addAll(pickedFiles.map((file) => file.path));
          });

          // Callback to the parent widget with the updated list of selected photos
          widget.onPhotosSelected(widget.selectedPhotos);
        } else {
          // Show a message indicating that the maximum number of images has been reached
          // You can customize this part based on your UI requirements
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Max Image Selection'),
              content: const Text('You can only select up to 5 images.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        // Pembatalan pemilihan gambar
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      widget.selectedPhotos.removeAt(index);

      // Callback to the parent widget with the updated list of selected photos
      widget.onPhotosSelected(widget.selectedPhotos);
    });
  }
}
