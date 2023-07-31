import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:me_adota/features/onboard/domain/repositories/onboard_repository.dart';

class OnboardRepositoryImpl implements OnboardRepository {
  final LocalDataSource _dataSource;

  const OnboardRepositoryImpl(this._dataSource);

  @override
  Future<void> finishOnboard() async {
    await _dataSource.setValue<bool>(Keys.isFirstTime, false);
  }
}
