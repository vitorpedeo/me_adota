import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/features/home/infra/models/species_filter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'pets_by_species_state.dart';

class PetsBySpeciesCubit extends Cubit<PetsBySpeciesState> {
  PetsBySpeciesCubit() : super(PetsBySpeciesState());

  void changeFilter(SpeciesFilterModel filter) {
    emit(
      PetsBySpeciesState(
        selectedFilter: filter,
      ),
    );
  }
}
