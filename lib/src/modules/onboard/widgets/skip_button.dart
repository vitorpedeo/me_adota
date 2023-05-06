import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

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
              debugPrint('Pular');
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
