import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secondhand_marketplace/feature/account/presentation/widgets/dropdown_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  bool isOnboarding = true;
  String? selectedCity;

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController cityController = TextEditingController(text: '');
  final TextEditingController addressController =
      TextEditingController(text: '');
  final TextEditingController phoneNumberController =
      TextEditingController(text: '');

  String? imgAvatar;

  Future<void> _getImage() async {
    try {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          imgAvatar = pickedFile.path;
        });
      } else {
        // Pembatalan pemilihan gambar
      }
    } catch (e) {
      // print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Info Akun',
            style: blackTextStyle.copyWith(fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                _buildProfileImage(),
                const SizedBox(
                  height: 28,
                ),
                _buildFormInput(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  label: 'Simpan',
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
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
            ? InkWell(
                onTap: _getImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: imgAvatar != null
                            ? Image.file(
                                File(imgAvatar!),
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              )
                            : Image.asset(
                                'assets/images/profile-picture.jpeg',
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              )),
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 24.sp,
                      color: primaryColor,
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: _getImage,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 24.sp,
                  color: primaryColor,
                ),
              ),
      ),
    );
  }

  Widget _buildFormInput() {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Nama',
          label: 'Nama*',
          controller: nameController,
        ),
        CustomDropdownFormField(
          label: 'Kota*', // Label yang akan ditampilkan di atas dropdown
          hintText:
              'Pilih Kota', // Hint text yang akan ditampilkan dalam dropdown
          value:
              selectedCity, // Nilai yang dipilih saat ini (harus diberikan dalam state)
          items: const [
            'Kota A',
            'Kota B',
            'Kota C',
            'Kota D',
            'Kota E',
          ], // Daftar pilihan
          onChanged: (newValue) {
            setState(() {
              selectedCity =
                  newValue; // Update nilai terpilih saat pengguna memilih
            });
          },
        ),
        CustomTextFormField(
          hintText: 'Contoh: Jalan Ikan Hiu 33',
          label: 'Alamat*',
          controller: addressController,
          maxLines: 3,
        ),
        CustomTextFormField(
          hintText: 'contoh: +628123456789',
          label: 'No Handphone*',
          controller: phoneNumberController,
        )
      ],
    );
  }
}
