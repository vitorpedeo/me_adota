import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/features/account/domain/use_cases/get_user_details.dart';
import 'package:me_adota/features/account/domain/use_cases/login.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final LoginUseCase _loginUseCase;
  final GetUserDetailsUseCase _getUserDetailsUseCase;

  AccountCubit(this._loginUseCase, this._getUserDetailsUseCase)
      : super(AccountInitial());

  Future<void> login() async {
    emit(AccountLoading());

    await _loginUseCase();

    emit(AccountLoaded(true));
  }

  void getUserDetails() {
    final bool isLogged = _getUserDetailsUseCase();

    emit(AccountLoaded(isLogged));
  }
}
