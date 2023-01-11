import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/domain/usecases/get_weather_by_city.dart';
import 'package:weather/features/presentation/managment/search_event.dart';
import 'package:weather/features/presentation/managment/search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final SearchWeatherByCity searchCity;
  CitySearchBloc({required this.searchCity}) : super(CityEmpty());

  Stream<CitySearchState> mapToEventToState(CitySearchEvent event) async* {
    if (event is SearchCity) {
      yield* _mapFetchCityToState(event.cityQuery);
    }
  }

  Stream<CitySearchState> _mapFetchCityToState(String cityQuery) async* {
    yield CitySearchLoading();
    final failureOrCity = await searchCity(ParamsCity(city: cityQuery));

    yield failureOrCity.fold(
        (failure) => CitySearchError(message: _mapFailureToMessage(failure)),
        (city) => CitySearchLoaded(weather: city));
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
