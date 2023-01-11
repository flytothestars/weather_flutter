import 'package:equatable/equatable.dart';

class WeatherListEntity extends Equatable {
  final int? dateTime;
  final String? dateTimeText;
  final MainEntity main;
  final WeatherEntity weather;
  final CloudsEntity clouds;
  final WindEntity wind;
  final int? visibility;
  final double? pop;
  final SnowEntity snow;
  final SysEntity sys;

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

class MainEntity {
  final String? temp;
  final String? feels_like;
  final String? temp_min;
  final String? temp_max;

  MainEntity({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
  });
}

class WeatherEntity {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

class CloudsEntity {
  final String? all;
  CloudsEntity({required this.all});
}

class WindEntity {
  final double? speed;
  final String? deg;
  final double? gust;

  WindEntity({required this.speed, required this.deg, required this.gust});
}

class SnowEntity {
  final String? h3;
  SnowEntity({required this.h3});
}

class SysEntity {
  final String? n;
  SysEntity({required this.n});
}
