import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/features/account/domain/use_cases/get_user_details.dart';
import 'package:me_adota/features/account/domain/use_cases/login.dart';
import 'package:me_adota/features/account/infra/models/account_page_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final LoginUseCase _loginUseCase;
  final GetUserDetailsUseCase _getUserDetailsUseCase;

  final List<AccountPageItem> accountPageItems = const [
    AccountPageItem(
      title: 'Atualizar meus dados',
      icon: PhosphorIconsBold.userCircle,
      link: '#',
    ),
    AccountPageItem(
      title: 'Alterar minha senha',
      icon: PhosphorIconsFill.key,
      link: '#',
    ),
    AccountPageItem(
      title: 'Cadastrar um pet',
      icon: PhosphorIconsFill.pawPrint,
      link: '#',
    ),
    AccountPageItem(
      title: 'Meus pets',
      icon: PhosphorIconsFill.bone,
      link: '#',
    ),
  ];

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
