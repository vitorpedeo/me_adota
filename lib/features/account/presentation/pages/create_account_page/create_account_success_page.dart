import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_svgs.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';

class CreateAccountSuccessPage extends StatelessWidget {
  const CreateAccountSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  AppSvgs.dog4,
                  height: 340,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Conta criada com sucesso!',
                  style: AppTheme.headlineBold.copyWith(
                    color: AppTheme.headText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Agora você pode cadastras pets para adoção e também manter um registro de todas as suas adoções!',
                  style: AppTheme.bodyRegular.copyWith(
                    color: AppTheme.bodyText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                AppButton(
                  text: 'Vamos lá!',
                  onPressed: () {
                    context.goNamed(AppRoutes.account.name);
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
