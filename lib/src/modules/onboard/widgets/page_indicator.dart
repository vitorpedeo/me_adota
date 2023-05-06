import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardController>(
      builder: (context, controller, child) {
        return SizedBox(
          height: 8,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final bool isActive = controller.currentPageIndex == index;

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
            itemCount: controller.pagesQuantity,
          ),
        );
      },
    );
  }
}
