import 'package:easy_bay/core/utils/app_colors.dart';
import 'package:easy_bay/features/view/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String routeName="/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    navigateToHome();
  }
  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child:
        Image.asset("assets/images/black_app_logo.png"),
       ),
    );
  }
}