import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class SkipSlidesButton extends StatelessWidget {
  const SkipSlidesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();

        return AnimatedOpacity(
          opacity: cubit.isLastSlide ? 0 : 1,
          duration: const Duration(
            milliseconds: 200,
          ),
          child: GestureDetector(
            onTap: () async {
              await cubit.finishOnboard();

              if (context.mounted) {
                context.goNamed(AppRoutes.home.name);
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
