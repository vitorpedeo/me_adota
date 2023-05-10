import 'package:flutter/material.dart';
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
            onTap: () {
              if (!controller.isLocalizationEnabled) {
                showLocalizationWarning(context);
              } else {
                //
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
