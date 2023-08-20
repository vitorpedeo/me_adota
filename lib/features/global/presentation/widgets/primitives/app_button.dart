import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:me_adota/config/theme/app_theme.dart';

enum AppButtonVariant {
  primary,
  secondary,
}

final Map<AppButtonVariant, Color> buttonColors = {
  AppButtonVariant.primary: AppTheme.pink,
  AppButtonVariant.secondary: AppTheme.white,
};

final Map<AppButtonVariant, Color> buttonTextColors = {
  AppButtonVariant.primary: AppTheme.white,
  AppButtonVariant.secondary: AppTheme.pink,
};

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final PhosphorIconData? icon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 40,
        decoration: BoxDecoration(
          color: onPressed != null ? buttonColors[variant] : AppTheme.gray,
          border: Border.all(
            color: onPressed != null ? AppTheme.pink : AppTheme.gray,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(
                  right: 6,
                ),
                child: PhosphorIcon(
                  icon!,
                  color: onPressed != null
                      ? buttonTextColors[variant]
                      : AppTheme.bodyText,
                  size: 18,
                ),
              ),
            Text(
              text,
              style: AppTheme.buttonMedium.copyWith(
                color: onPressed != null
                    ? buttonTextColors[variant]
                    : AppTheme.bodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
