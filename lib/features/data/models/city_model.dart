import 'package:weather/features/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required id,
    required name,
    required coordinate,
    required country,
    required population,
    required timezone,
    required sunrise,
    required sunset,
  }) : super(
            id: id,
            name: name,
            coordinate: coordinate,
            country: country,
            population: population,
            timezone: timezone,
            sunrise: sunrise,
            sunset: sunset);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'],
        name: json['name'],
        coordinate: CoordinateModel.fromJson(json['coord']),
        country: json['country'],
        population: json['population'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coord': coordinate,
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset
    };
  }
}

class CoordinateModel extends CoordinateEntity {
  CoordinateModel({required lat, required lon}) : super(lat: lat, lon: lon);

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(lat: json['lat'], lon: json['lon']);
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lon': lon};
  }
}
