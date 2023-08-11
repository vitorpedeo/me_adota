import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/use_cases/get_selected_city.dart';
import 'package:me_adota/features/home/domain/use_cases/get_selected_state.dart';
import 'package:me_adota/features/home/domain/use_cases/select_city.dart';
import 'package:me_adota/features/home/domain/use_cases/select_state.dart';
import 'package:me_adota/features/home/infra/models/city.dart';
import 'package:me_adota/features/home/infra/models/state.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final SelectStateUseCase _selectStateUseCase;
  final SelectCityUseCase _selectCityUseCase;
  final GetSelectedStateUseCase _getSelectedStateUseCase;
  final GetSelectedCityUseCase _getSelectedCityUseCase;

  CurrentLocationCubit(this._selectStateUseCase, this._selectCityUseCase,
      this._getSelectedStateUseCase, this._getSelectedCityUseCase)
      : super(const CurrentLocationState());

  void getSavedLocation() {
    final String? encodedState = _getSelectedStateUseCase();
    final String? encodedCity = _getSelectedCityUseCase();

    if (encodedState != null && encodedCity != null) {
      final state = StateModel.fromJson(jsonDecode(encodedState));
      final city = CityModel.fromJson(jsonDecode(encodedCity));

      emit(
        CurrentLocationState(
          selectedState: state,
          selectedCity: city,
        ),
      );
    }
  }

  Future<void> selectState(StateEntity st) async {
    emit(
      state.copyWith(
        state: st,
      ),
    );
  }

  Future<void> selectCity(CityEntity city) async {
    emit(
      state.copyWith(
        city: city,
      ),
    );
  }

  Future<void> saveLocation() async {
    if (state.state != null && state.city != null) {
      _selectStateUseCase(state.state!);
      _selectCityUseCase(state.city!);

      emit(
        state.copyWith(
          selectedState: state.state,
          selectedCity: state.city,
        ),
      );
    }
  }

  void resetCity() {
    if (state.city != null) {
      emit(
        state.copyWith(
          city: null,
        ),
      );
    }
  }
}
