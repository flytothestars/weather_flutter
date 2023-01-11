import 'package:weather/core/error/exception.dart';
import 'package:weather/core/platform/network_info.dart';
import 'package:weather/features/data/datasource/weather_remote_data_source.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';
import 'package:weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/features/domain/repositories/weather_repositories.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinate() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WeatherEntity>> searchWeatherByCity(
      String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.searchWeatherByCity(query);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        print("Network not connected");
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WeatherEntity>> updateWeather() {
    throw UnimplementedError();
  }
}
