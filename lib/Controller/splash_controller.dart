import 'dart:async';

import 'package:get/get.dart';
import 'package:super_weather/Screen/homepage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const Homepage());
    });
  }
}
