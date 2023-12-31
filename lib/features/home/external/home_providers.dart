import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/home/presentation/cubits/cities_list/cities_list_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/current_location/current_location_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/pets_by_species/pets_by_species_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';

class HomeProviders {
  static final all = [
    BlocProvider<StatesListCubit>(
      create: (_) => getIt(),
    ),
    BlocProvider<CitiesListCubit>(
      create: (_) => getIt(),
    ),
    BlocProvider<CurrentLocationCubit>(
      create: (_) => getIt()..getSavedLocation(),
    ),
    BlocProvider<PetsBySpeciesCubit>(
      create: (_) => getIt(),
    ),
  ];
}
