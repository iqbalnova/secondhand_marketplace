import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/config/firebase_service.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/form.dart';
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

  void onPasswordSuffixTap() {
    setState(() {
      isPasswordObsecure = !isPasswordObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              isPasswordObsecure: isPasswordObsecure,
              onPasswordSuffixTap: onPasswordSuffixTap,
            ),
            const RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordObsecure;
  final VoidCallback onPasswordSuffixTap;

  final FirebaseService _firebaseService = FirebaseService();

  LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.isPasswordObsecure,
      required this.onPasswordSuffixTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: titleTextStyle,
            ),
            FormWidget(
              childern: [
                CustomTextFormField(
                  hintText: 'Contoh: johndee@gmail.com',
                  label: 'Email',
                  controller: emailController,
                ),
                CustomTextFormField(
                  hintText: 'Masukkan Password',
                  label: 'Password',
                  isObsecure: isPasswordObsecure,
                  controller: passwordController,
                  onTap: () {
                    onPasswordSuffixTap();
                  },
                ),
              ],
            ),
            CustomButton(
              onTap: () {
                // _firebaseService.signInWithEmailPassword(
                //     emailController.text, passwordController.text);
                // _firebaseService.signOut();
                // _firebaseService.deleteAccount();
                // _firebaseService.getCurrentUser();
                // _firebaseService.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.main, (route) => false);
              },
              label: 'Masuk',
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Row(
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
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
