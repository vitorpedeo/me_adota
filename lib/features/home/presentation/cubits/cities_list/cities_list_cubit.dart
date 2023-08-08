import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/use_cases/fetch_cities.dart';

part 'cities_list_state.dart';

class CitiesListCubit extends Cubit<CitiesListState> {
  final FetchCitiesUseCase _fetchCitiesUseCase;

  CitiesListCubit(this._fetchCitiesUseCase) : super(CitiesListInitial());

  Future<void> fetchCitiesByState(StateEntity state) async {
    emit(CitiesListLoading());

    final result = await _fetchCitiesUseCase(state);

    result.fold(
      (error) => emit(CitiesListError(error.message)),
      (states) => emit(CitiesListLoaded(states)),
    );
  }
}
