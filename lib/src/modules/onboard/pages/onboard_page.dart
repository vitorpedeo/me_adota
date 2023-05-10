import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/modules/onboard/widgets/next_page_button.dart';
import 'package:me_adota/src/modules/onboard/widgets/page_indicator.dart';
import 'package:me_adota/src/modules/onboard/widgets/page_slider.dart';
import 'package:me_adota/src/modules/onboard/widgets/skip_button.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_bottom_sheet.dart';
import 'package:provider/provider.dart';

/**
 * TODO: Refactor this page to be a StatefulWidget, using WidgetBinding to
 * listen to the lifecycle events
 */
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
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
                  SkipButton(),
                ],
              ),
              const PageSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  PageIndicator(),
                  NextPageButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
