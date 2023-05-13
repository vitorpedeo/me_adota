import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalizationController extends ChangeNotifier {
  bool _isPermissionEnabled = false;
  int _permissionDeniedCount = 0;

  bool get isPermissionEnabled => _isPermissionEnabled;
  int get permissionDeniedCount => _permissionDeniedCount;

  LocalizationController() {
    checkPermission();
  }

  void checkPermission() async {
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
    PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isPermanentlyDenied || _permissionDeniedCount > 1) {
      await openAppSettings();
    } else {
      await Permission.locationWhenInUse.request();
    }

    status = await Permission.locationWhenInUse.status;
    _permissionDeniedCount = status.isDenied ? _permissionDeniedCount + 1 : 0;

    _isPermissionEnabled = status.isGranted;
    notifyListeners();
  }
}
