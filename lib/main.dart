import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:super_weather/Controller/splash_controller.dart';
import 'package:super_weather/Screen/splash.dart';

void main() {
  SplashController().onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Super Weather',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
