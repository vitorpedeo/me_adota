import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/models/option_model.dart';

class AppDialogSelectController<T> extends ChangeNotifier {
  final List<Option<T>> options;
  List<Option<T>> _filteredOptions = [];
  T? _selectedValue;

  AppDialogSelectController({
    required this.options,
  }) {
    _filteredOptions = options;
  }

  List<Option<T>> get filteredOptions => _filteredOptions;
  T? get selectedValue => _selectedValue;

  void filter(String value) {
    if (value.isEmpty) {
      _filteredOptions = options;

      notifyListeners();

      return;
    }

    _filteredOptions = options
        .where((element) => removeDiacritics(element.label)
            .toLowerCase()
            .contains(removeDiacritics(value).toLowerCase()))
        .toList();

    notifyListeners();
  }

  void onSelect(T value) {
    _selectedValue = value;

    notifyListeners();
  }
}
