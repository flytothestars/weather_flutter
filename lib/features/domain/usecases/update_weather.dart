import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/core/usecases/usecase.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';
import 'package:weather/features/domain/repositories/weather_repositories.dart';

class UpdateWeather extends UseCase<List<WeatherEntity>, ParamsUpdate> {
  final WeatherRepository weatherRepository;

  UpdateWeather(this.weatherRepository);

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(ParamsUpdate params) async {
    return await weatherRepository.updateWeather();
  }
}

class ParamsUpdate extends Equatable {
  @override
  List<Object?> get props => [];
}
