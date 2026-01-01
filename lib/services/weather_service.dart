import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  String apiKey = '979302d3c01443a384d95743232202';
  String baseURL = 'https://api.weatherapi.com/v1';

  Future<WeatherModel> getWeather(String city) async {
    try {
      Response response = await dio.get(
        '$baseURL/forecast.json?key=$apiKey&q=$city&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMeassage =
          e.response?.data['error']['message'] ??
          'There is an error, please try again later';
      throw Exception(errorMeassage);
    } catch (e) {
      log(e.toString());
      throw Exception('There is an error, please try again later');
    }
  }
}
