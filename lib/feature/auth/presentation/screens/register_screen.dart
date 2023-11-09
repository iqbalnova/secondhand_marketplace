import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  bool isPasswordObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  Text(
                    'Daftar',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    hintText: 'Nama Lengkap',
                    label: 'Nama',
                    controller: fullNameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintText: 'Contoh: johndee@gmail.com',
                    label: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintText: 'Buat Password',
                    label: 'Buat Password',
                    isObsecure: isPasswordObsecure,
                    controller: passwordController,
                    onTap: () {
                      setState(() {
                        isPasswordObsecure = !isPasswordObsecure;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    onTap: () {},
                    label: 'Daftar',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Masuk di sini',
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: primary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
