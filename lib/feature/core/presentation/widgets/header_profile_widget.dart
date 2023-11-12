import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class HeaderInfoProfile extends StatelessWidget {
  final String name;
  final String city;
  final VoidCallback? onTapEdit;

  const HeaderInfoProfile({
    super.key,
    required this.name,
    required this.city,
    this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.network(
                'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          _renderInfoData(),
          _buildEditButton()
        ],
      ),
    );
  }

  Widget _renderInfoData() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: blackTextStyle,
            ),
            Text(
              city,
              style: blackTextStyle.copyWith(
                fontSize: 12.sp,
                color: const Color(0xff8A8A8A),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Material(
      child: onTapEdit != null
          ? InkWell(
              onTap: onTapEdit,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: primaryColor),
                ),
                child: const Text('Edit'),
              ),
            )
          : const SizedBox(),
    );
  }
}
