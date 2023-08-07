import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/onboard/presentation/widgets/next_slide_button.dart';
import 'package:me_adota/features/onboard/presentation/widgets/onboard_slider.dart';
import 'package:me_adota/features/onboard/presentation/widgets/skip_slides_button.dart';
import 'package:me_adota/features/onboard/presentation/widgets/slide_indicator.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            bottom: 48,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SkipSlidesButton(),
                ],
              ),
              const OnboardSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SlideIndicator(),
                  NextSlideButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
