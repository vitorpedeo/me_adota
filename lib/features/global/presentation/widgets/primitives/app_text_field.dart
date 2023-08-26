import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;

  const AppTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        isDense: true,
        filled: true,
        fillColor: AppTheme.white,
        hintText: hintText,
        hintStyle: AppTheme.bodyRegular.copyWith(
          color: AppTheme.placeholder,
        ),
      ),
      style: AppTheme.bodyRegular.copyWith(
        color: AppTheme.bodyText,
      ),
    );
  }
}
