import 'dart:convert';

import 'package:weather/core/constant.dart';
import 'package:weather/core/error/exception.dart';
import 'package:weather/features/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCoordinate(String lat, String lon);
  Future<WeatherModel> searchWeatherByCity(String query);
}

/// Two API request for weather. Search by city and search by coordinate
/// api.openweathermap.org/data/2.5/forecast?q={city}&appid={API key}
/// api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  ///Search weather by city
  ///Refresh weather by cache
  @override
  Future<WeatherModel> searchWeatherByCity(String query) async {
    final response = await client.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$query&appid=$API_KEY&units=metric'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final weather = json.decode(response.body);
      return WeatherModel.fromJson(weather);
    } else {
      throw ServerException();
    }
  }

  ///Search weather by coordinate
  @override
  Future<WeatherModel> getWeatherByCoordinate(String lat, String lon) async {
    final response = await client.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$API_KEY&units=metric'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final weather = json.decode(response.body);
      return WeatherModel.fromJson(weather);
    } else {}

    throw UnimplementedError();
  }
}
