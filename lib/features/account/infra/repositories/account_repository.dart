import 'package:me_adota/features/account/domain/repositories/account_repository.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';

class AccountRepositoryImpl extends AccountRepository {
  final LocalDataSource _localDataSource;

  AccountRepositoryImpl(this._localDataSource);

  @override
  Future<void> login() async {
    await _localDataSource.setValue<bool>(
      Keys.isLogged,
      true,
    );
  }

  @override
  bool getUserDetails() {
    return _localDataSource.getValue<bool>(Keys.isLogged) ?? false;
  }
}
