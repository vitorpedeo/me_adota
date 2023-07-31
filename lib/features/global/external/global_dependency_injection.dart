import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/global/external/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';

class GlobalDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Data sources
    final localDataSource = LocalDataSourceImpl();
    await localDataSource.init();
    getIt.registerSingleton<LocalDataSource>(
      localDataSource,
    );
  }
}
