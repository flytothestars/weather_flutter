import 'package:equatable/equatable.dart';

abstract class CitySearchEvent extends Equatable {
  const CitySearchEvent();
  @override
  List<Object?> get props => [];
}

class SearchCity extends CitySearchEvent {
  final String cityQuery;
  const SearchCity(this.cityQuery);
}
