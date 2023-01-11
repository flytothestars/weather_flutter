import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/core/usecases/usecase.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';
import 'package:weather/features/domain/repositories/weather_repositories.dart';

class GetWeatherByCoordinate extends UseCase<List<WeatherEntity>, ParamsCoord> {
  final WeatherRepository weatherRepository;

  GetWeatherByCoordinate(this.weatherRepository);

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(ParamsCoord params) async {
    return await weatherRepository.getWeatherByCoordinate();
  }
}

class ParamsCoord extends Equatable {
  @override
  List<Object?> get props => [];
}
