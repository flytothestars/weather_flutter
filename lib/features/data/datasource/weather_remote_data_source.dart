import 'dart:convert';

import 'package:weather/core/constant.dart';
import 'package:weather/core/error/exception.dart';
import 'package:weather/features/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  // Future<List<WeatherModel>> updateWeather();
  // Future<List<WeatherModel>> getWeatherByCoordinate();
  Future<WeatherModel> searchWeatherByCity(String query);
}

/**
 * api.openweathermap.org/data/2.5/forecast?q=&appid=
 * 
 */
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> searchWeatherByCity(String query) async {
    final response = await client.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$query&appid=$API_KEY&units=metric'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final weather = json.decode(response.body);
      //print(weather);
      // print((weather as List).map((e) => WeatherModel.fromJson(e)).toList());
      return WeatherModel.fromJson(weather);
    } else {
      throw ServerException();
    }
  }
}
