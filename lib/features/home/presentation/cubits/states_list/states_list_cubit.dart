import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/use_cases/fetch_states.dart';

part 'states_list_state.dart';

class StatesListCubit extends Cubit<StatesListState> {
  final FetchStatesUseCase _fetchStatesUseCase;

  StatesListCubit(this._fetchStatesUseCase) : super(StatesListInitial());

  Future<void> fetchStates() async {
    emit(StatesListLoading());

    final result = await _fetchStatesUseCase();

    result.fold(
      (error) => emit(StatesListError(error.message)),
      (states) => emit(StatesListLoaded(states)),
    );
  }
}
