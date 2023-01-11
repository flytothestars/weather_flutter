import 'package:equatable/equatable.dart';
import 'package:weather/features/domain/entities/weather_entity.dart';

abstract class CitySearchState extends Equatable {
  const CitySearchState();
  @override
  List<Object?> get props => [];
}

class CityEmpty extends CitySearchState {}

class CitySearchLoading extends CitySearchState {}

class CitySearchLoaded extends CitySearchState {
  final List<WeatherEntity> weather;
  const CitySearchLoaded({required this.weather});
  @override
  List<Object?> get props => [weather];
}

class CitySearchError extends CitySearchState {
  final String message;
  const CitySearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
