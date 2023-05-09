import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalizationController extends ChangeNotifier {
  bool _isPermissionEnabled = false;

  bool get isPermissionEnabled => _isPermissionEnabled;

  LocalizationController() {
    checkInitialPermission();
  }

  void checkInitialPermission() async {
    final PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      _isPermissionEnabled = true;
      notifyListeners();
    }
  }

  void handleLocalizationToggle(bool value) async {
    if (value) {
      final PermissionStatus status = await Permission.locationWhenInUse.status;

      if (status.isGranted) {
        _isPermissionEnabled = true;
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
        _isPermissionEnabled = true;
        notifyListeners();

        return;
      }
    } else {
      debugPrint('Settings should open');
    }
  }
}
