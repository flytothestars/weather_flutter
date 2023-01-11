import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<WeatherEntity>>> updateWeather();
  Future<Either<Failure, List<WeatherEntity>>> getWeatherByCoordinate();
  Future<Either<Failure, List<WeatherEntity>>> searchWeatherByCity(
      String query);
}
