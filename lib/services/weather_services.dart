import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel>? getWeather(String locarion) async {
    var response = await http
        .get(Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?q=${locarion}&appid=33e367183f7b3cfca24f5efad074fb47"))
        .timeout(Duration(seconds: 7));

    var Data = jsonDecode(response.body);
    print(WeatherModel.fromJson(Data).cityName);

    return WeatherModel.fromJson(Data);
  }
}
