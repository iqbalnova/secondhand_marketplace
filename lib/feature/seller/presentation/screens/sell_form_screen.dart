import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/account/presentation/widgets/dropdown_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/feature/seller/presentation/widgets/render_add_photo_product.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
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

  List<String> selectedPhotos = [];

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    nameProductController.dispose();
    priceProductController.dispose();
    descriptionProductController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                keyboardType: TextInputType.number,
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
              RenderAddPhotoProduct(
                selectedPhotos: selectedPhotos,
                onPhotosSelected: (List<String> newPhotos) {
                  setState(() {
                    selectedPhotos = newPhotos;
                  });
                },
              ),
              RenderButton(
                onTapPublish: () {
                  if (kDebugMode) {
                    print(selectedPhotos);
                  }
                },
                onTapPreview: () {
                  Navigator.pushNamed(context, AppRoutes.previewScreen,
                      arguments: {
                        'imgList': selectedPhotos,
                        'category': selectedCategory.toString(),
                        'productName': nameProductController.text,
                        'price': priceProductController.text,
                        'description': descriptionProductController.text,
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RenderButton extends StatelessWidget {
  final VoidCallback onTapPublish;
  final VoidCallback onTapPreview;

  const RenderButton({
    super.key,
    required this.onTapPublish,
    required this.onTapPreview,
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
              onTap: onTapPreview,
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
            child: CustomButton(onTap: onTapPublish, label: 'Terbitkan'),
          ),
        ],
      ),
    );
  }
}
