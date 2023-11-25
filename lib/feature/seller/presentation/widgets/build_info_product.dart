import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/utils/currency_formatter.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class BuildInfoProduct extends StatelessWidget {
  final String category;
  final String productName;
  final String price;

  const BuildInfoProduct(
      {super.key,
      required this.category,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            category,
            style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: const Color(0xff8A8A8A),
            ),
          ),
          Text(
            formatCurrency(double.parse(price)),
            style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
