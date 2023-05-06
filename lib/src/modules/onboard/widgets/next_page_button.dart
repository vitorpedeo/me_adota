import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class NextPageButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.pink,
        fixedSize: const Size(56, 56),
        shape: const CircleBorder(),
      ),
      child: Icon(
        isLastPage ? Icons.check : Icons.arrow_right_alt_rounded,
        color: AppTheme.white,
        size: 28,
      ),
    );
  }
}
