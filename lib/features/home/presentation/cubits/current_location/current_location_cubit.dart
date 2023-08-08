import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/use_cases/get_selected_state.dart';
import 'package:me_adota/features/home/domain/use_cases/select_state.dart';
import 'package:me_adota/features/home/infra/models/state.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final SelectStateUseCase _selectStateUseCase;
  final GetSelectedStateUseCase _getSelectedStateUseCase;

  CurrentLocationCubit(this._selectStateUseCase, this._getSelectedStateUseCase)
      : super(const CurrentLocationState());

  Future<void> selectState(StateEntity state) async {
    emit(
      CurrentLocationState(
        state: state,
      ),
    );
  }

  void getSelectedState() {
    final String? encodedState = _getSelectedStateUseCase();

    if (encodedState != null) {
      final state = StateModel.fromJson(jsonDecode(encodedState));

      emit(
        CurrentLocationState(
          state: state,
        ),
      );
    }
  }

  Future<void> selectCity(CityEntity city) async {
    emit(
      CurrentLocationState(
        state: state.state,
        city: city,
      ),
    );
  }

  Future<void> saveLocation() async {
    print('STATE: ${state.state} - CITY: ${state.city}');
  }
}
