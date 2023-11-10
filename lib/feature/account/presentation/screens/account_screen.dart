import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isOnboarding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Akun Saya',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              _buildProfileImage(),
              const SizedBox(
                height: 32,
              ),
              AccountMenu(
                label: 'Ubah akun',
                icon: Icons.create_rounded,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.editAccount);
                },
              ),
              AccountMenu(
                label: 'Pengaturan akun',
                icon: Icons.settings,
                onTap: () {},
              ),
              AccountMenu(
                label: 'Keluar',
                icon: Icons.logout_rounded,
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: blackTextStyle.copyWith(
                      color: const Color(0xff8A8A8A),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Align(
      alignment: Alignment.center, // Tengahkan secara horizontal
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xffE2D4F0),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: isOnboarding
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                  fit: BoxFit.cover,
                ),
              )
            : Icon(
                Icons.camera_alt_outlined,
                size: 24.sp,
                color: primaryColor,
              ),
      ),
    );
  }
}

class AccountMenu extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const AccountMenu({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffE5E5E5)))),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: primaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                label,
                style: blackTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
