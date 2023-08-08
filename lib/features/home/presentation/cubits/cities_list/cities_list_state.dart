part of 'cities_list_cubit.dart';

abstract class CitiesListState extends Equatable {}

class CitiesListInitial extends CitiesListState {
  @override
  List<Object> get props => [];
}

class CitiesListLoading extends CitiesListState {
  @override
  List<Object> get props => [];
}

class CitiesListLoaded extends CitiesListState {
  final List<CityEntity> cities;

  CitiesListLoaded(this.cities);

  @override
  List<Object> get props => [cities];
}

class CitiesListError extends CitiesListState {
  final String message;

  CitiesListError(this.message);

  @override
  List<Object> get props => [message];
}
