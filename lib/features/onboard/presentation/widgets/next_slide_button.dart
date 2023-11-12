import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class NextSlideButton extends StatelessWidget {
  const NextSlideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();

        return ElevatedButton(
          onPressed: () async {
            if (cubit.isLastSlide) {
              await cubit.finishOnboard();

              if (context.mounted) {
                context.goNamed(AppRoutes.home.name);
              }

              return;
            }

            cubit.nextPage();
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
              cubit.isLastSlide
                  ? PhosphorIcons.check(
                      PhosphorIconsStyle.bold,
                    )
                  : PhosphorIcons.arrowRight(
                      PhosphorIconsStyle.bold,
                    ),
              key: ValueKey(cubit.isLastSlide),
              color: AppTheme.white,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}
