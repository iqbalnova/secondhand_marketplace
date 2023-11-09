import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: primary,
        ),
        child: Text(label, style: whiteTextStyle),
      ),
    );
  }
}
