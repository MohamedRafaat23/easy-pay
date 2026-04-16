import 'package:easy_bay/core/utils/app_routes.dart';
import 'package:easy_bay/features/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( MyApp(appRoutes: AppRoutes(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required AppRoutes appRoutes, });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) { 
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
         onGenerateRoute: AppRoutes.generateRoute,
      );
      }
    );
  }
}
