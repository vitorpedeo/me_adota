import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class SlideIndicator extends StatelessWidget {
  const SlideIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();

        return SizedBox(
          height: 8,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final bool isActive = cubit.currentSlide == index;

              return AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.pink : AppTheme.pinkAlpha,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 6,
              );
            },
            itemCount: cubit.slidesQuantity,
          ),
        );
      },
    );
  }
}
