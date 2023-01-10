import 'package:equatable/equatable.dart';

class WeatherListEntity extends Equatable {
  final int? dateTime;
  final String? dateTimeText;
  final Main main;
  final Weather weather;
  final Clouds clouds;
  final Wind wind;
  final int? visibility;
  final double? pop;
  final Snow snow;
  final Sys sys;

  const WeatherListEntity({
    required this.dateTime,
    required this.dateTimeText,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.snow,
    required this.sys,
  });

  @override
  List<Object?> get props => [
        dateTime,
        dateTimeText,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        snow,
        sys
      ];
}

class Main {
  final String? temp;
  final String? feels_like;
  final String? temp_min;
  final String? temp_max;

  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
  });
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

class Clouds {
  final String? all;
  Clouds({required this.all});
}

class Wind {
  final double? speed;
  final String? deg;
  final double? gust;

  Wind({required this.speed, required this.deg, required this.gust});
}

class Snow {
  final String? h3;
  Snow({required this.h3});
}

class Sys {
  final String? n;
  Sys({required this.n});
}
