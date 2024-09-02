import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_weather/Custom_Widget/custom_text.dart';

class HourWeather extends StatelessWidget {
  final String image;
  final String temC;
  final String hour;

  const HourWeather({super.key, required this.image, required this.temC, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlurryContainer(
          blur: 10,
          height: 150.h,
          width: 80.w,
          elevation: 5,
          shadowColor: Colors.black87.withOpacity(0.5),
          color: Colors.transparent,
          padding: const EdgeInsets.all(10).r,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(image))),
                ),
                CustomText(
                    text: '$temC°',
                    size: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                CustomText(
                    text: hour,
                    size: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ],
            ),
          )),
    );
  }
}
