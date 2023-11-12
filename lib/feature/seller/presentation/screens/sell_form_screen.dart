import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/account/presentation/widgets/dropdown_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class SellFormScreen extends StatefulWidget {
  const SellFormScreen({super.key});

  @override
  State<SellFormScreen> createState() => _SellFormScreenState();
}

class _SellFormScreenState extends State<SellFormScreen> {
  String? selectedCategory;

  final TextEditingController nameProductController =
      TextEditingController(text: '');
  final TextEditingController priceProductController =
      TextEditingController(text: '');
  final TextEditingController descriptionProductController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Detail Product',
            style: blackTextStyle.copyWith(fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              CustomTextFormField(
                hintText: 'Nama Produk',
                label: 'Nama Produk',
                controller: nameProductController,
              ),
              CustomTextFormField(
                hintText: 'Rp 0,00',
                label: 'Harga Produk',
                controller: priceProductController,
              ),
              CustomDropdownFormField(
                label:
                    'Kategori', // Label yang akan ditampilkan di atas dropdown
                hintText:
                    'Pilih Kategori', // Hint text yang akan ditampilkan dalam dropdown
                value:
                    selectedCategory, // Nilai yang dipilih saat ini (harus diberikan dalam state)
                items: const [
                  'Electronics',
                  'Fashion',
                  'Game',
                  'Gadget',
                  'General',
                ], // Daftar pilihan
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory =
                        newValue; // Update nilai terpilih saat pengguna memilih
                  });
                },
              ),
              CustomTextFormField(
                hintText: 'Contoh: Iphone 15 Pro Max ex Ibox like new',
                label: 'Deskripsi',
                controller: descriptionProductController,
                maxLines: 3,
              ),
              const RenderAddPhotoProduct(),
              const RenderButton()
            ],
          ),
        ),
      ),
    );
  }
}

class RenderAddPhotoProduct extends StatelessWidget {
  const RenderAddPhotoProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foto Prodduk',
            style: blackTextStyle,
          ),
          Container(
            margin: EdgeInsets.only(top: 4.h),
            child: InkWell(
              onTap: () {},
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: const Color(0xffD0D0D0),
                dashPattern: const [6],
                strokeWidth: 1.0,
                radius: Radius.circular(12.r),
                child: Container(
                    height: 96.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 24.sp,
                        color: const Color(0xff8A8A8A),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RenderButton extends StatelessWidget {
  const RenderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 156.w,
            child: CustomButton(
              onTap: () {},
              label: 'Preview',
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: primaryColor)),
              textStyle: blackTextStyle,
            ),
          ),
          SizedBox(
            width: 156.w,
            child: CustomButton(onTap: () {}, label: 'Terbitkan'),
          ),
        ],
      ),
    );
  }
}
