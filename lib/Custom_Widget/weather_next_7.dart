import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_weather/Custom_Widget/custom_text.dart';

class WeatherNext7 extends StatelessWidget {
  final String image;
  final String date;
  final String maxTemp;
  final String minTemp;
  final String condition;
  const WeatherNext7(
      {super.key,
      required this.image,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BlurryContainer(
          blur: 10,
          width: MediaQuery.sizeOf(context).width * 0.9,
          elevation: 5,
          shadowColor: Colors.black87.withOpacity(0.5),
          color: Colors.transparent,
          padding: const EdgeInsets.all(10).r,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: date,
                        size: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(image))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                            text: 'Max Temp $maxTemp°',
                            size: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        CustomText(
                            text: 'Min Temp $minTemp°',
                            size: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    CustomText(
                        text: condition,
                        size: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
