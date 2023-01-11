import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/domain/usecases/get_weather_by_city.dart';
import 'package:weather/features/presentation/managment/search_event.dart';
import 'package:weather/features/presentation/managment/search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final SearchWeatherByCity searchCity;
  CitySearchBloc({required this.searchCity}) : super(CityEmpty()) {
    on<SearchCity>(_onEvent);
  }

  FutureOr<void> _onEvent(
    SearchCity event,
    Emitter<CitySearchState> emit,
  ) async {
    emit(CitySearchLoading());
    final failureOrCity = await searchCity(ParamsCity(city: event.cityQuery));
    emit(failureOrCity.fold(
        (failure) => CitySearchError(message: _mapFailureToMessage(failure)),
        (city) => CitySearchLoaded(weather: city)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexcepted Error';
    }
  }
}
