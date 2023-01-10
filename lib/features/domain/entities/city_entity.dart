import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int? id;
  final String? name;
  final Coordinate coordinate;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const CityEntity({
    required this.id,
    required this.name,
    required this.coordinate,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props =>
      [id, name, coordinate, country, population, timezone, sunrise, sunset];
}

class Coordinate {
  final double? lat;
  final double? lon;

  const Coordinate({this.lat, this.lon});
}
