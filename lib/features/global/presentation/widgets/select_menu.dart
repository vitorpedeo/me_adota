import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:me_adota/config/theme/app_theme.dart';

class SelectMenu<T> extends StatelessWidget {
  final List<T> items;
  final Function(T?)? onChanged;
  final Function(T)? shownValue;
  final T? selectedItem;
  final String? label;
  final String? hintText;
  final String searchHintText;
  final bool disabled;

  const SelectMenu({
    super.key,
    this.items = const [],
    this.onChanged,
    this.shownValue,
    this.selectedItem,
    this.label,
    this.hintText,
    this.searchHintText = 'Filtrar opções',
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: (item1, item2) {
        return item1 == item2;
      },
      itemAsString: (item) => _getShownValue(item),
      popupProps: PopupProps.dialog(
        showSelectedItems: true,
        showSearchBox: true,
        searchDelay: const Duration(
          milliseconds: 0,
        ),
        listViewProps: const ListViewProps(
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
        ),
        emptyBuilder: (context, searchEntry) {
          return Center(
            child: Text(
              'Nenhuma opção encontrada',
              style: AppTheme.bodyRegular.copyWith(
                color: AppTheme.bodySecondaryText,
              ),
            ),
          );
        },
        itemBuilder: (context, item, isSelected) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.pink : AppTheme.background,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.bold.mapPin,
                      size: 20,
                      color: isSelected ? AppTheme.white : AppTheme.pink,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _getShownValue(item),
                      style: AppTheme.bodyRegular.copyWith(
                        color: isSelected ? AppTheme.white : AppTheme.bodyText,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                if (isSelected)
                  PhosphorIcon(
                    PhosphorIcons.bold.check,
                    size: 20,
                    color: AppTheme.white,
                  ),
              ],
            ),
          );
        },
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: searchHintText,
            hintStyle: AppTheme.bodySecondaryMedium.copyWith(
              color: AppTheme.placeholder,
            ),
            filled: true,
            fillColor: const Color(0xFFF2F4F7),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        dialogProps: const DialogProps(
          backgroundColor: AppTheme.background,
          contentPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
        ),
      ),
      items: items,
      dropdownButtonProps: DropdownButtonProps(
        icon: PhosphorIcon(
          PhosphorIcons.regular.caretDown,
          color: AppTheme.bodySecondaryText,
          size: 20,
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          suffixIcon: PhosphorIcon(
            PhosphorIcons.regular.caretDown,
            color: AppTheme.bodySecondaryText,
            size: 20,
          ),
          filled: true,
          fillColor: AppTheme.background,
          labelStyle: AppTheme.bodySecondaryRegular.copyWith(
            color: AppTheme.bodySecondaryText,
          ),
          hintStyle: AppTheme.bodyRegular.copyWith(
            color: AppTheme.placeholder,
          ),
          labelText: label,
          hintText: hintText,
        ),
      ),
      onChanged: disabled
          ? null
          : (value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
      selectedItem: selectedItem,
    );
  }

  String _getShownValue(T? item) {
    if (item == null) {
      return '';
    }

    if (shownValue != null) {
      return shownValue!(item);
    }

    return item.toString();
  }
}
