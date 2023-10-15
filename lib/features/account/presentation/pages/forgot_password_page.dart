import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Esqueci minha senha',
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
            children: [
              Text(
                'Insira o e-mail associado a sua conta para iniciarmos o processo de recuperação de senha',
                style: AppTheme.bodyRegular.copyWith(
                  color: AppTheme.bodyText,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(
                hintText: 'E-mail',
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                text: 'Confirmar',
                onPressed: () {
                  context.goNamed(AppRoutes.recoverPassword.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
