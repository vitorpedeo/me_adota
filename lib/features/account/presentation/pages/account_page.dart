import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_svgs.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/account/presentation/cubits/account/account_cubit.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return _buildLoadingPage();
        }

        if (state is AccountLoaded && state.isLogged) {
          return _buildLoggedPage(context);
        }

        return _buildNotLoggedPage(context);
      },
    );
  }

  Widget _buildLoadingPage() {
    return const Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildNotLoggedPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  AppSvgs.dog3,
                  height: 340,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Parece que você não está logado!',
                  style: AppTheme.headlineBold.copyWith(
                    color: AppTheme.headText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Column(
                  children: [
                    AppButton(
                      text: 'Entrar na minha conta',
                      onPressed: () {
                        context.goNamed(AppRoutes.login.name);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Não tem uma conta?',
                      style: AppTheme.bodySecondaryRegular.copyWith(
                        color: AppTheme.bodyText,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(AppRoutes.createAccount.name);
                      },
                      child: Text(
                        'Criar agora',
                        style: AppTheme.bodySecondaryBold.copyWith(
                          color: AppTheme.pink,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoggedPage(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: PhosphorIcons.bold.smiley,
        title: 'Minha conta',
      ),
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Bem vindo!',
                  style: AppTheme.headlineBold.copyWith(
                    color: AppTheme.headText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
