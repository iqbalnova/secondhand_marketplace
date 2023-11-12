import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/core/presentation/widgets/header_profile_widget.dart';
import 'package:secondhand_marketplace/feature/core/presentation/widgets/list_filter_menu.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class SellingList extends StatefulWidget {
  const SellingList({Key? key}) : super(key: key);

  @override
  State<SellingList> createState() => _SellingListState();
}

class _SellingListState extends State<SellingList> {
  late List<Map<String, dynamic>> menuOptions;
  int selectedMenu = 0;
  List<Map<String, dynamic>> myProducts = [];

  @override
  void initState() {
    super.initState();

    menuOptions = [
      {
        'icon': Icons.add_box_outlined,
        'label': 'Produk',
        'width': 140.w,
        'onTap': () {
          setState(() {
            selectedMenu = 0;
          });
        }
      },
      {
        'icon': Icons.heart_broken_outlined,
        'label': 'Diminati',
        'width': 140.w,
        'onTap': () {
          setState(() {
            selectedMenu = 1;
          });
        }
      },
      {
        'icon': Icons.currency_exchange_outlined,
        'label': 'Terjual',
        'width': 140.w,
        'onTap': () {
          setState(() {
            selectedMenu = 2;
          });
        }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _renderHeaderWidget(),
            ListFilterMenu(
              menuOptions: menuOptions,
              selectedIndex: selectedMenu,
            ),
            _renderMenuProduct()
          ],
        ),
      ),
    );
  }

  Widget _renderHeaderWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Jual Saya',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 24,
          ),
          HeaderInfoProfile(
            name: 'Variant 616',
            city: 'Timeline 616',
            onTapEdit: () {
              Navigator.pushNamed(context, AppRoutes.editAccount);
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _renderMenuProduct() {
    if (selectedMenu == 0) {
      return _buildProductList();
    } else if (selectedMenu == 1) {
      return _buildInterestedProductList(
          'Belum ada produkmu yang diminati nih, sabar ya rejeki nggak kemana kok');
    } else {
      return _buildInterestedProductList(
          'Belum ada produkmu yang terjual nih, sabar ya rejeki nggak kemana kok');
    }
  }

  Widget _buildProductList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 196.h),
        itemCount: myProducts.length + 1, // +1 for the "Add Product" cell
        itemBuilder: (context, index) {
          return _renderProductCell(index);
        },
      ),
    );
  }

  Widget _renderProductCell(int index) {
    if (index == 0) {
      return _renderAddProduct();
    } else {
      return _renderMyProduct(myProducts[index - 1]);
    }
  }

  Widget _renderAddProduct() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, AppRoutes.sellForm);
          myProducts.add({
            'productName': 'Iphone 15 Pro Max 1Tb',
            'price': '15.000.000',
            'imageUri': '/assets/images/.file',
            'onTap': ['Electronics, Fashion']
          });
        });
      },
      child: SizedBox(
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color(0xffD0D0D0),
          dashPattern: const [6],
          strokeWidth: 1.0,
          radius: Radius.circular(12.r),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 24.sp,
                    color: const Color(0xff8A8A8A),
                  ),
                  Text(
                    'Tambah Produk',
                    style:
                        blackTextStyle.copyWith(color: const Color(0xff8A8A8A)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderMyProduct(Map<String, dynamic> product) {
    return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xffD0D0D0), width: 1.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.network(
                    'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                    width: double.infinity,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Canon EOS 3600',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff151515),
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        'Aksesoris',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff8A8A8A),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Rp 250.000',
                        style: blackTextStyle.copyWith(
                            color: const Color(0xff151515),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildInterestedProductList(String describtion) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty-seller-product.png',
            width: 172.w,
            height: 121.h,
          ),
          Text(describtion,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  color: const Color(0xff8A8A8A), fontWeight: FontWeight.w400)),
        ],
      )),
    );
  }
}
