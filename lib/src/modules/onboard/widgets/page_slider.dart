import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class PageSlider extends StatelessWidget {
  const PageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardController>(
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
                        controller.onboardContentList[index].description,
                        style: AppTheme.bodyRegular.copyWith(
                          color: AppTheme.bodyText,
                        ),
                      ),
                      controller.onboardContentList[index].extraWidget ??
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
