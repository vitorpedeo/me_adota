import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/modules/onboard/utils/show_localization_warning.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardController>(
      builder: (context, controller, child) {
        return AnimatedOpacity(
          opacity: controller.isLastPage ? 0 : 1,
          duration: const Duration(
            milliseconds: 200,
          ),
          child: GestureDetector(
            onTap: () async {
              final bool canSkip = await controller.canSkipOnboard();

              if (context.mounted) {
                if (!canSkip) {
                  showLocalizationWarning(context);
                } else {
                  context.goNamed(
                    AppRoutesConfig.home.name,
                  );
                }
              }
            },
            child: Text(
              'Pular',
              style: AppTheme.buttonMedium.copyWith(
                color: AppTheme.bodySecondaryText,
              ),
            ),
          ),
        );
      },
    );
  }
}
