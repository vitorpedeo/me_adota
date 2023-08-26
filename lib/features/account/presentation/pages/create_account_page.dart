import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/dialog_select.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_text_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Criar uma conta',
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
                hintText: 'Nome completo',
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(
                hintText: 'Telefone',
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  Expanded(
                    child: DialogSelect(
                      hintText: 'UF',
                      fillColor: AppTheme.white,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: DialogSelect(
                      hintText: 'Cidade',
                      fillColor: AppTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
                height: 16,
              ),
              const AppTextField(
                hintText: 'Confirmar senha',
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                text: 'Criar conta',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
