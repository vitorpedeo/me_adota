import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/widgets/next_page_button.dart';
import 'package:me_adota/src/modules/onboard/widgets/page_indicator.dart';
import 'package:me_adota/src/modules/onboard/widgets/page_slider.dart';
import 'package:me_adota/src/modules/onboard/widgets/skip_button.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final controller = context.read<LocalizationController>();
      controller.checkInitialPermission();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
