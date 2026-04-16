import 'package:easy_bay/features/view/auth/forget_password/forget_password_screen.dart';
import 'package:easy_bay/features/view/auth/login/login_screen.dart';
import 'package:easy_bay/features/view/auth/register/register_screen.dart';
import 'package:easy_bay/features/view/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        
      case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const ForgetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}