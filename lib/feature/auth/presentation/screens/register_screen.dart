import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondhand_marketplace/config/firebase_service.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/button_widget.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/form.dart';
import 'package:secondhand_marketplace/feature/auth/presentation/widgets/input_widget.dart';
import 'package:secondhand_marketplace/routes/app_routes.dart';
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
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        // backgroundColor: Colors.transparent,
        // elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            RegisterForm(
              fullNameController: fullNameController,
              emailController: emailController,
              passwordController: passwordController,
              isPasswordObsecure: isPasswordObsecure,
              onPasswordSuffixTap: () {
                setState(() {
                  isPasswordObsecure = !isPasswordObsecure;
                });
              },
            ),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordObsecure;
  final VoidCallback onPasswordSuffixTap;

  final FirebaseService _firebaseService = FirebaseService();

  RegisterForm({
    Key? key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordObsecure,
    required this.onPasswordSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar',
                style: titleTextStyle,
              ),
              FormWidget(
                childern: [
                  CustomTextFormField(
                    hintText: 'Nama Lengkap',
                    label: 'Nama',
                    controller: fullNameController,
                  ),
                  CustomTextFormField(
                    hintText: 'Contoh: johndee@gmail.com',
                    label: 'Email',
                    controller: emailController,
                  ),
                  CustomTextFormField(
                    hintText: 'Buat Password',
                    label: 'Buat Password',
                    isObsecure: isPasswordObsecure,
                    controller: passwordController,
                    onTap: onPasswordSuffixTap,
                  ),
                ],
              ),
              CustomButton(
                onTap: () {
                  _firebaseService.registerWithEmailPassword(
                      emailController.text, passwordController.text);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.main, (route) => false);
                },
                label: 'Daftar',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Row(
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
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
