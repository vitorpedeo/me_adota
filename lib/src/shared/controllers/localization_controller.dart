import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalizationController extends ChangeNotifier {
  bool _isEnabled = false;

  bool get isEnabled => _isEnabled;

  LocalizationController() {
    checkInitialPermission();
  }

  void checkInitialPermission() async {
    final PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      _isEnabled = true;
      notifyListeners();
    }
  }

  void handleLocalizationToggle(bool value) async {
    if (value) {
      final PermissionStatus status = await Permission.locationWhenInUse.status;

      if (status.isGranted) {
        _isEnabled = true;
        notifyListeners();

        return;
      }

      if (status.isPermanentlyDenied) {
        debugPrint('Settings should open');
        return;
      }

      final PermissionStatus requestStatus =
          await Permission.locationWhenInUse.request();

      if (requestStatus.isGranted) {
        _isEnabled = true;
        notifyListeners();

        return;
      }
    } else {
      debugPrint('Settings should open');
    }
  }
}
