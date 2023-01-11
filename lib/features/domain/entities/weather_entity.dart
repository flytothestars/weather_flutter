import 'package:equatable/equatable.dart';
import 'package:weather/features/domain/entities/city_entity.dart';
import 'package:weather/features/domain/entities/weather_list_entity.dart';

class WeatherEntity extends Equatable {
  final String? code;
  final String? message;
  final int? cnt;
  final CityEntity city;
  final List<WeatherListEntity> weatherList;
  const WeatherEntity(
      {required this.city,
      required this.weatherList,
      required this.cnt,
      required this.code,
      required this.message});

  @override
  List<Object?> get props => [city, weatherList, code, cnt, message];
}
