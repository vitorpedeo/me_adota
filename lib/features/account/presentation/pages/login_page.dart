import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/account/presentation/cubits/account/account_cubit.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Entrar na minha conta',
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const AppTextField(
                hintText: 'E-mail',
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(
                hintText: 'Senha',
              ),
              const SizedBox(
                height: 6,
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(AppRoutes.forgotPassword.name);
                },
                child: Text(
                  'Esqueceu sua senha?',
                  style: AppTheme.captionBold.copyWith(
                    color: AppTheme.pink,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                text: 'Entrar',
                onPressed: () async {
                  final accountCubit = context.read<AccountCubit>();

                  await accountCubit.login();

                  if (context.mounted) {
                    context.goNamed(AppRoutes.account.name);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
