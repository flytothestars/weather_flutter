import 'package:equatable/equatable.dart';
import 'package:weather/features/domain/entities/city_entity.dart';
import 'package:weather/features/domain/entities/weather_list_entity.dart';

class WeatherEntity extends Equatable {
  final String? cod;
  final String? message;
  final int? cnt;
  final CityEntity city;
  final List<WeatherListEntity> list;
  const WeatherEntity(
      {required this.city,
      required this.list,
      required this.cnt,
      required this.cod,
      required this.message});

  @override
  List<Object?> get props => [city, list, cod, cnt, message];
}
