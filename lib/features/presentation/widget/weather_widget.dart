import 'package:flutter/material.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherEntity weatherEntity;
  const WeatherWidget({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Text('${weatherEntity.city.coordinate.lat}');
  }
}
