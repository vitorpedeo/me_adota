import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/modules/onboard/widgets/next_page_button.dart';
import 'package:me_adota/src/modules/onboard/widgets/page_indicator.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (context) => OnboardController(),
      child: Scaffold(
        backgroundColor: AppTheme.white,
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
                  children: [
                    Consumer<OnboardController>(
                      builder: (context, controller, child) {
                        return AnimatedOpacity(
                          opacity: controller.isLastPage ? 0 : 1,
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              debugPrint('Pular');
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
                    ),
                  ],
                ),
                Consumer<OnboardController>(
                  builder: (context, controller, child) {
                    return Expanded(
                      child: PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: (value) {
                          controller.changePage(value);
                        },
                        itemCount: controller.onboardContentList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                controller.onboardContentList[index].image,
                                height: 360,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.onboardContentList[index].title,
                                    style: AppTheme.headlineBold.copyWith(
                                      color: AppTheme.headText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller
                                        .onboardContentList[index].description,
                                    style: AppTheme.bodyRegular.copyWith(
                                      color: AppTheme.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
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
      ),
    );
  }
}
