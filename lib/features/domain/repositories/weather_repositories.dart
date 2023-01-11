import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> updateWeather();
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinate();
  Future<Either<Failure, WeatherEntity>> searchWeatherByCity(String query);
}
