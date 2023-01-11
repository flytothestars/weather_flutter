import 'package:weather/features/data/models/city_model.dart';
import 'package:weather/features/data/models/weather_list_model.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required cod,
      required message,
      required cnt,
      required list,
      required city})
      : super(cod: cod, message: message, cnt: cnt, list: list, city: city);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        list: WeatherListModel.fromJson(json['list']),
        city: CityModel.fromJson(json['city']));
  }

  Map<String, dynamic> toJson() {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list,
      'city': city,
    };
  }
}
