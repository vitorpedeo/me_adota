part of 'current_location_cubit.dart';

class CurrentLocationState extends Equatable {
  final StateEntity? state;
  final CityEntity? city;
  final StateEntity? selectedState;
  final CityEntity? selectedCity;

  const CurrentLocationState(
      {this.state, this.city, this.selectedState, this.selectedCity});

  @override
  List<Object?> get props => [state, city, selectedState, selectedCity];

  CurrentLocationState copyWith({
    StateEntity? state,
    CityEntity? city,
    StateEntity? selectedState,
    CityEntity? selectedCity,
  }) {
    return CurrentLocationState(
      state: state ?? this.state,
      city: city ?? this.city,
      selectedState: selectedState ?? this.selectedState,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}
