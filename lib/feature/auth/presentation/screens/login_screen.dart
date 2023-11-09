import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
import 'package:secondhand_marketplace/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    'Masuk',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
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
                    hintText: 'Masukkan Password',
                    label: 'Password',
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
                    label: 'Masuk',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun? ',
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: Text(
                    'Daftar di sini',
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
