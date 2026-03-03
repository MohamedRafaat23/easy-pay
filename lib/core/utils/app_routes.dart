import 'package:easy_bay/features/ui/auth/login/login_screen.dart';
import 'package:easy_bay/features/ui/auth/register/register_screen.dart';
import 'package:easy_bay/features/ui/splash/splash.dart';
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