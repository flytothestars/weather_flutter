import 'package:weather/features/domain/entities/weather_list_entity.dart';

class WeatherListModel extends WeatherListEntity {
  const WeatherListModel(
      {required dateTime,
      required dateTimeText,
      required main,
      required weather,
      required clouds,
      required wind,
      required visibility,
      required pop,
      required snow,
      required sys})
      : super(
            dateTime: dateTime,
            dateTimeText: dateTimeText,
            main: main,
            weather: weather,
            clouds: clouds,
            wind: wind,
            visibility: visibility,
            pop: pop,
            snow: snow,
            sys: sys);

  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
        dateTime: json['dt'],
        dateTimeText: json['dt_txt'],
        main: MainModel.fromJson(json['main']),
        weather: WeatherInnerModel.fromJson(json['weather']),
        clouds: CloudsModel.fromJson(json['clouds']),
        wind: WindModel.fromJson(json['wind']),
        visibility: json['visibility'],
        pop: json['pop'],
        snow: SnowModel.fromJson(json['snow']),
        sys: SysModel.fromJson(json['sys']));
  }
}

class MainModel extends MainEntity {
  MainModel(
      {required temp,
      required feels_like,
      required temp_min,
      required temp_max})
      : super(
            temp: temp,
            feels_like: feels_like,
            temp_max: temp_max,
            temp_min: temp_min);

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
        temp: json['temp'],
        feels_like: json['feels_like'],
        temp_min: json['temp_min'],
        temp_max: json['temp_max']);
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
    };
  }
}

class WeatherInnerModel extends WeatherEntity {
  WeatherInnerModel(
      {required id, required main, required description, required icon})
      : super(id: id, main: main, description: description, icon: icon);

  factory WeatherInnerModel.fromJson(Map<String, dynamic> json) {
    return WeatherInnerModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}

class CloudsModel extends CloudsEntity {
  CloudsModel({required all}) : super(all: all);

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['all']);
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all,
    };
  }
}

class WindModel extends WindEntity {
  WindModel({required speed, required deg, required gust})
      : super(speed: speed, deg: deg, gust: gust);

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
        speed: json['speed'], deg: json['deg'], gust: json['gust']);
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }
}

class SnowModel extends SnowEntity {
  SnowModel({required h3}) : super(h3: h3);

  factory SnowModel.fromJson(Map<String, dynamic> json) {
    return SnowModel(h3: json['3h']);
  }

  Map<String, dynamic> toJson() {
    return {
      '3h': h3,
    };
  }
}

class SysModel extends SysEntity {
  SysModel({required n}) : super(n: n);

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(n: json['pod']);
  }

  Map<String, dynamic> toJson() {
    return {'pod': n};
  }
}
