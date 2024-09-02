import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_weather/Controller/Api%20Controller/controller.dart';

class SearchTextfeild extends StatelessWidget {
  const SearchTextfeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlueAccent.withOpacity(.6)),
      child: TextFormField(
        controller: controller.getText,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintStyle: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                )),
            hintText: 'Search',
            border: InputBorder.none),
      ),
    );
  }
}
