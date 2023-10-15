import 'package:me_adota/features/account/domain/repositories/account_repository.dart';

class GetUserDetailsUseCase {
  final AccountRepository _accountRepository;

  GetUserDetailsUseCase(this._accountRepository);

  bool call() {
    return _accountRepository.getUserDetails();
  }
}
