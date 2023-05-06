import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardController>(
      builder: (context, controller, child) {
        return ElevatedButton(
          onPressed: () {
            if (!controller.isLastPage) {
              controller.nextPage();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.pink,
            fixedSize: const Size(56, 56),
            shape: const CircleBorder(),
          ),
          child: Icon(
            controller.isLastPage ? Icons.check : Icons.arrow_right_alt_rounded,
            color: AppTheme.white,
            size: 28,
          ),
        );
      },
    );
  }
}
