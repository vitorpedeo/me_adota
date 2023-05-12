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
      requestPermission();
    } else {
      openAppSettings();
    }
  }

  Future<void> requestPermission() async {
    final PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      _isPermissionEnabled = true;
      notifyListeners();

      return;
    }

    if (status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }

    final PermissionStatus requestStatus =
        await Permission.locationWhenInUse.request();

    if (requestStatus.isGranted) {
      _isPermissionEnabled = true;
      notifyListeners();

      return;
    }

    if (requestStatus.isPermanentlyDenied) {
      openAppSettings();
      return;
    }
  }
}
