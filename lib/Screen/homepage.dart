import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:super_weather/Controller/Api%20Controller/api_controller.dart';
import 'package:super_weather/Custom_Widget/custom_text.dart';
import 'package:super_weather/Custom_Widget/hour_weather.dart';
import 'package:super_weather/Custom_Widget/weather_next_7.dart';
import 'package:super_weather/Custom_Widget/weather_view.dart';

import '../Controller/Api Controller/controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiController());
    final controller = Get.put(Controller());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87.withOpacity(0.2),
        body: Column(
          children: [
            Expanded(
                child: Obx(
              () => FutureBuilder(
                  future:
                      apiController.getWeatherData(controller.location.value),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: WeatherBg(
                                  weatherType: WeatherType.lightRainy,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          text: 'Weather',
                                          size: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controller.dialog();
                                              },
                                              icon: const Icon(
                                                Icons.search_rounded,
                                                color: Colors.white,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.my_location_rounded,
                                                color: Colors.white,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                WeatherView(
                                  cityName:
                                      snapshot.data!.location!.name.toString(),
                                  countryNAme: snapshot.data!.location!.country
                                      .toString(),
                                  dateTime: DateFormat.yMMMMEEEEd().format(
                                      DateTime.parse(snapshot
                                          .data!.current!.lastUpdated
                                          .toString())),
                                  image:
                                      'https:${snapshot.data!.current!.condition!.icon.toString()}',
                                  tempC:
                                      snapshot.data!.current!.tempC.toString(),
                                  condition: snapshot
                                      .data!.current!.condition!.text
                                      .toString(),
                                  feelllike: snapshot.data!.current!.feelslikeC
                                      .toString(),
                                  wind: snapshot.data!.current!.windKph
                                      .toString(),
                                  humadity: snapshot.data!.current!.humidity
                                      .toString(),
                                  visibility: snapshot.data!.current!.visKm!
                                      .round()
                                      .toString(),
                                  leanth: snapshot.data!.forecast!
                                      .forecastday![0].hour!.length
                                      .toInt(),
                                  hourIndex: snapshot.data!.forecast!
                                      .forecastday![0].hour!.length,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomText(
                                    text: 'Today Weather',
                                    size: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 150.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        final hour = snapshot.data!.forecast!
                                            .forecastday![0].hour![index];
                                        return HourWeather(
                                            hour: DateFormat.j().format(
                                                DateTime.parse(
                                                    hour.time.toString())),
                                            temC: hour.tempC.toString(),
                                            image:
                                                'https:${hour.condition!.icon.toString()}');
                                      },
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.forecast!
                                          .forecastday![0].hour!.length),
                                ),
                                CustomText(
                                    text: 'Weather Next 10 Days',
                                    size: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 140.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        final hour = snapshot.data!.forecast!
                                            .forecastday![index];
                                        return WeatherNext7(
                                          condition: hour.day!.condition!.text
                                              .toString(),
                                          maxTemp:
                                              hour.day!.maxtempC.toString(),
                                          minTemp:
                                              hour.day!.mintempC.toString(),
                                          date: DateFormat.yMMMMEEEEd().format(
                                              DateTime.parse(
                                                  hour.date.toString())),
                                          image:
                                              'https:${hour.day!.condition!.icon.toString()}',
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot
                                          .data!.forecast!.forecastday!.length),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}
