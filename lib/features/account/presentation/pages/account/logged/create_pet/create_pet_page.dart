import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/dialog_select.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreatePetPage extends StatelessWidget {
  const CreatePetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Cadastrar um pet',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto',
                  style: AppTheme.headlineSecondaryMedium.copyWith(
                    color: AppTheme.headText,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 56,
                    vertical: 48,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    border: Border.all(
                      width: 1,
                      color: AppTheme.placeholder,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        PhosphorIconsFill.pawPrint,
                        color: AppTheme.placeholder,
                        size: 80,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppButton(
                        text: 'Adicionar',
                        icon: PhosphorIconsBold.plus,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Informações gerais',
                  style: AppTheme.headlineSecondaryMedium.copyWith(
                    color: AppTheme.headText,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Column(
                  children: [
                    AppTextField(
                      hintText: 'Nome',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DialogSelect(
                            hintText: 'Espécie',
                            fillColor: AppTheme.white,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: DialogSelect(
                            hintText: 'Gênero',
                            fillColor: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DialogSelect(
                      hintText: 'Porte',
                      fillColor: AppTheme.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            hintText: 'Idade',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 2,
                          child: DialogSelect(
                            hintText: 'Tipo',
                            fillColor: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: 'Descrição',
                      // maxLines: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Características',
                  style: AppTheme.headlineSecondaryMedium.copyWith(
                    color: AppTheme.headText,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: AppTextField(
                            hintText: 'Característica (Ex.: dócil)',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppTheme.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              PhosphorIconsBold.plus,
                              color: AppTheme.white,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.pinkAlpha,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Dócil',
                            style: AppTheme.captionBold.copyWith(
                              color: AppTheme.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                AppButton(
                  text: 'Cadastrar',
                  onPressed: () {
                    context.goNamed(AppRoutes.createPetSuccess.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
