import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class ListFilterMenu extends StatelessWidget {
  final List<Map<String, dynamic>> menuOptions;
  final int selectedIndex;

  const ListFilterMenu(
      {Key? key, required this.menuOptions, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      height: 44.h,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildMenuItems(),
      ),
    );
  }

  List<Widget> _buildMenuItems() {
    return menuOptions.asMap().entries.map<Widget>((entry) {
      final index = entry.key;
      final option = entry.value;
      final isSelected = index == selectedIndex;

      return Center(
        child: Container(
          margin: EdgeInsets.only(right: 16.w),
          width: option['width'],
          child: InkWell(
            onTap: option['onTap'],
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : const Color(0xffE2D4F0),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                leading: Icon(
                  option['icon'],
                  size: 20.sp,
                  color: isSelected ? Colors.white : null,
                ),
                title: Text(
                  option['label'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : null,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
