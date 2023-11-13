import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_text_field.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Atualizar minha senha',
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
                hintText: 'Senha antiga',
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(
                hintText: 'Nova senha',
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(
                hintText: 'Confirmar nova senha',
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                text: 'Atualizar',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
