import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/global/external/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';

class GlobalDependencyInjection implements DependencyInjection {
  @override
  void inject() {
    // Data sources
    final localDataSource = LocalDataSourceImpl();
    localDataSource.init().then((_) {
      getIt.registerSingleton<LocalDataSource>(
        localDataSource,
      );
    });
  }
}
