import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class PageIndicator extends StatelessWidget {
  final int activeIndex;
  final int pagesQuantity;

  const PageIndicator({
    super.key,
    required this.activeIndex,
    required this.pagesQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          width: activeIndex == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: activeIndex == index ? AppTheme.pink : AppTheme.pinkAlpha,
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
      itemCount: pagesQuantity,
    );
  }
}
