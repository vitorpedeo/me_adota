import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/models/option_model.dart';

class AppDialogSelectController<T> extends ChangeNotifier {
  final List<Option<T>> options;
  List<Option<T>> _filteredOptions = [];

  AppDialogSelectController({
    required this.options,
  }) {
    _filteredOptions = options;
  }

  List<Option<T>> get filteredOptions => _filteredOptions;

  void filter(String value) {
    if (value.isEmpty) {
      _filteredOptions = options;

      notifyListeners();

      return;
    }

    _filteredOptions = options
        .where((element) =>
            element.label.toLowerCase().contains(value.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
