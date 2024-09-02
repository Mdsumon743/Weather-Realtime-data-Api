import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:super_weather/Model/weather_model.dart';

class ApiController extends GetxController {


  Future<WeatherModel?> getWeatherData(String search) async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=c41a878f0920484c88f60825243008&q=$search&days=10'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
