import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/global/external/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/external/rest_client/rest_client.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client.dart';

class GlobalDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Rest client
    getIt.registerSingleton<RestClient>(RestClientImpl());

    // Data sources
    final localDataSource = LocalDataSourceImpl();
    await localDataSource.init();
    getIt.registerSingleton<LocalDataSource>(
      localDataSource,
    );
  }
}
