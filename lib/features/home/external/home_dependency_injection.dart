import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';
import 'package:me_adota/features/home/domain/use_cases/fetch_states.dart';
import 'package:me_adota/features/home/domain/use_cases/get_selected_state.dart';
import 'package:me_adota/features/home/domain/use_cases/select_state.dart';
import 'package:me_adota/features/home/external/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/repositories/location_repository.dart';
import 'package:me_adota/features/home/presentation/cubits/current_location/current_location_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';

class HomeDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Data sources
    getIt.registerSingleton<LocationApiDataSource>(
        LocationApiDataSourceImpl(getIt()));

    // Repositories
    getIt.registerSingleton<LocationRepository>(
        LocationRepositoryImpl(getIt(), getIt()));

    // Use cases
    getIt.registerSingleton<FetchStatesUseCase>(FetchStatesUseCase(getIt()));
    getIt.registerSingleton<SelectStateUseCase>(SelectStateUseCase(getIt()));
    getIt.registerSingleton<GetSelectedStateUseCase>(
        GetSelectedStateUseCase(getIt()));

    // Cubits
    getIt.registerFactory<StatesListCubit>(() => StatesListCubit(getIt()));
    getIt.registerFactory<CurrentLocationCubit>(
        () => CurrentLocationCubit(getIt(), getIt()));
  }
}
