import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomLeading extends StatelessWidget {
  final PhosphorIconData? icon;
  final VoidCallback? onPressed;

  const CustomLeading({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    if (icon != null) {
      return PhosphorIcon(
        icon!,
        size: 24,
        color: AppTheme.pink,
      );
    }

    if (!navigator.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      icon: PhosphorIcon(
        PhosphorIcons.bold.arrowLeft,
        size: 24,
        color: AppTheme.pink,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          navigator.maybePop();
        }
      },
    );
  }
}
