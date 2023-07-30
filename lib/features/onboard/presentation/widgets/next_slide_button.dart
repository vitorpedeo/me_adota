import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

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
            if (!cubit.isLastSlide) {
              cubit.nextPage();
              return;
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
              cubit.isLastSlide
                  ? PhosphorIcons.bold.check
                  : PhosphorIcons.bold.arrowRight,
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
