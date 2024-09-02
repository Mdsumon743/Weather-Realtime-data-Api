import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_weather/Controller/Api%20Controller/api_controller.dart';
import 'package:super_weather/Custom_Widget/custom_text.dart';
import 'package:super_weather/Custom_Widget/search_textfeild.dart';

class Controller extends GetxController {
  RxString location = 'auto:ip'.obs;
  final getText = TextEditingController();
  setData() {
    location.value = getText.text;
  }

  dialog() {
    Get.defaultDialog(
        title: 'Search Location',
        titleStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        backgroundColor: Colors.white.withOpacity(0.8),
        content: const SearchTextfeild(),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const CustomText(
                  text: 'Cancel',
                  size: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () {
                if (getText.text.isEmpty) {
                  location.value = 'auto:ip';
                } else if (getText.text.isNotEmpty) {
                  setData();
                  ApiController().getWeatherData(location.value);
                } else {
                  location.value = 'auto:ip';
                }
                Get.back();
              },
              child: const CustomText(
                  text: 'Ok',
                  size: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
        ]);
  }
}
