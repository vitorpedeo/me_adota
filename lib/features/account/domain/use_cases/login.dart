import 'package:me_adota/features/account/domain/repositories/account_repository.dart';

class LoginUseCase {
  final AccountRepository _accountRepository;

  LoginUseCase(this._accountRepository);

  Future<void> call() async {
    return await _accountRepository.login();
  }
}
