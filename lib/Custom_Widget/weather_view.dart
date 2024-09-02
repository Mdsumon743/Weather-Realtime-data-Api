import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_weather/Custom_Widget/custom_text.dart';

class WeatherView extends StatelessWidget {
  final String cityName;
  final String countryNAme;
  final String dateTime;
  final String image;
  final String tempC;
  final String condition;
  final String feelllike;
  final String wind;
  final String humadity;
  final String visibility;
  final int leanth;
  final dynamic hourIndex;

  const WeatherView(
      {super.key,
      required this.cityName,
      required this.countryNAme,
      required this.dateTime,
      required this.image,
      required this.tempC,
      required this.condition,
      required this.feelllike,
      required this.wind,
      required this.humadity,
      required this.visibility,
      required this.leanth,
      this.hourIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              BlurryContainer(
                blur: 10,
                width: double.infinity,
                elevation: 10,
                shadowColor: Colors.black.withOpacity(0.5),
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CustomText(
                          text: cityName,
                          size: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 18,
                          ),
                          CustomText(
                              text: countryNAme,
                              size: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      CustomText(
                          text: dateTime,
                          size: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(image))),
                          ),
                          CustomText(
                              text: '$tempC°',
                              size: 40.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                      CustomText(
                          text: condition,
                          size: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                              textAlign: TextAlign.center,
                              text: 'Feel like\n$feelllike',
                              size: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                          CustomText(
                              textAlign: TextAlign.center,
                              text: 'Wind\n$feelllike Km/h',
                              size: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              textAlign: TextAlign.center,
                              text: 'Humidity\n$humadity%',
                              size: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                          CustomText(
                              textAlign: TextAlign.center,
                              text: 'Visibility\n$visibility Km',
                              size: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
