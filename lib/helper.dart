import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:weather/core/platform/network_info.dart';
import 'package:weather/features/data/datasource/weather_remote_data_source.dart';
import 'package:weather/features/data/repositories/weather_repositories_impl.dart';
import 'package:weather/features/domain/repositories/weather_repositories.dart';
import 'package:weather/features/domain/usecases/get_weather_by_city.dart';
import 'package:weather/features/domain/usecases/get_weather_by_coord.dart';
import 'package:weather/features/domain/usecases/update_weather.dart';
import 'package:weather/features/presentation/managment/search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit

  sl.registerFactory(
    () => CitySearchBloc(searchCity: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => SearchWeatherByCity(sl()));
  sl.registerLazySingleton(() => GetWeatherByCoordinate(sl()));
  sl.registerLazySingleton(() => UpdateWeather(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
