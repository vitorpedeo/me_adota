import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();

        return Expanded(
          child: PageView.builder(
            controller: cubit.pageController,
            onPageChanged: (value) {
              cubit.changePage(value);
            },
            itemCount: cubit.slidesQuantity,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    cubit.onboardSlides[index].image,
                    height: 360,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.onboardSlides[index].title,
                        style: AppTheme.headlineBold.copyWith(
                          color: AppTheme.headText,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        cubit.onboardSlides[index].description,
                        style: AppTheme.bodyRegular.copyWith(
                          color: AppTheme.bodyText,
                        ),
                      ),
                      cubit.onboardSlides[index].extraWidget ??
                          const SizedBox.shrink(),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
