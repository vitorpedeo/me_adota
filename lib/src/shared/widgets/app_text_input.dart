import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppTheme.background,
        contentPadding: const EdgeInsets.all(14),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        hintStyle: AppTheme.bodySecondaryMedium.copyWith(
          color: const Color.fromARGB(255, 174, 180, 188),
        ),
        hintText: 'Filtrar opções',
      ),
    );
  }
}
