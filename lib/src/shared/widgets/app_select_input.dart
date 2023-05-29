import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppSelectInput<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) label;
  final T? selectedItem;
  final void Function(T?) onChanged;

  final String? hint;

  const AppSelectInput(
      {super.key,
      required this.items,
      required this.label,
      this.selectedItem,
      required this.onChanged,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 48,
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownButton<T>(
          value: selectedItem,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                label(item),
              ),
            );
          }).toList(),
          isDense: true,
          isExpanded: true,
          hint: Text(
            hint ?? '',
          ),
          dropdownColor: AppTheme.white,
          style: AppTheme.bodySecondaryRegular.copyWith(
            color: AppTheme.placeholder,
          ),
          icon: PhosphorIcon(
            PhosphorIcons.regular.caretDown,
            color: AppTheme.bodySecondaryText,
            size: 20,
          ),
        ),
      ),
    );
  }
}
