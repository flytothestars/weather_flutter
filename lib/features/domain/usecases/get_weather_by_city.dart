import 'package:equatable/equatable.dart';
import 'package:weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/core/usecases/usecase.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';
import 'package:weather/features/domain/repositories/weather_repositories.dart';

class SearchWeatherByCity extends UseCase<List<WeatherEntity>, ParamsCity> {
  final WeatherRepository weatherRepository;

  SearchWeatherByCity(this.weatherRepository);

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(ParamsCity params) async {
    return await weatherRepository.searchWeatherByCity(params.city);
  }
}

class ParamsCity extends Equatable {
  final String city;

  const ParamsCity({required this.city});

  @override
  List<Object?> get props => [city];
}
