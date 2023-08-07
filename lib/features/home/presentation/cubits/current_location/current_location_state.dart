part of 'current_location_cubit.dart';

class CurrentLocationState extends Equatable {
  final StateEntity? state;
  final CityEntity? city;

  const CurrentLocationState({this.state, this.city});

  @override
  List<Object?> get props => [state, city];
}
