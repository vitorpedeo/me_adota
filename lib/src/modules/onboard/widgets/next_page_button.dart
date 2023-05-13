import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/modules/onboard/utils/show_localization_warning.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
            } else if (!controller.isLocalizationEnabled) {
              showLocalizationWarning(context);
            } else {
              context.goNamed(
                AppRoutesConfig.home.name,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.pink,
            fixedSize: const Size(56, 56),
            shape: const CircleBorder(),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 200,
            ),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: PhosphorIcon(
              controller.isLastPage
                  ? PhosphorIcons.bold.check
                  : PhosphorIcons.bold.arrowRight,
              key: ValueKey(controller.isLastPage),
              color: AppTheme.white,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}
