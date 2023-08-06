import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';
import 'package:me_adota/features/home/domain/use_cases/fetch_states.dart';
import 'package:me_adota/features/home/external/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/repositories/location_repository.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';

class HomeDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Data sources
    getIt.registerSingleton<LocationApiDataSource>(
        LocationApiDataSourceImpl(getIt()));

    // Repositories
    getIt
        .registerSingleton<LocationRepository>(LocationRepositoryImpl(getIt()));

    // Use cases
    getIt.registerSingleton<FetchStatesUseCase>(FetchStatesUseCase(getIt()));

    // Cubits
    getIt.registerFactory<StatesListCubit>(() => StatesListCubit(getIt()));
  }
}
