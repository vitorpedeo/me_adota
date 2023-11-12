import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/account/presentation/cubits/account/account_cubit.dart';
import 'package:me_adota/features/account/presentation/pages/account_page/logged_page/logged_page.dart';
import 'package:me_adota/features/account/presentation/pages/account_page/not_logged_page/not_logged_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Scaffold(
            backgroundColor: AppTheme.background,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is AccountLoaded && state.isLogged) {
          return const LoggedPage();
        }

        return const NotLoggedPage();
      },
    );
  }
}
