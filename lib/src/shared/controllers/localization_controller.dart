import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:me_adota/src/shared/models/user_location_model.dart';

class LocalizationController extends ChangeNotifier {
  bool _isPermissionEnabled = false;
  int _permissionDeniedCount = 0;

  bool get isPermissionEnabled => _isPermissionEnabled;
  int get permissionDeniedCount => _permissionDeniedCount;

  LocalizationController() {
    checkPermission();
  }

  void checkPermission() async {
    final LocationPermission status = await Geolocator.checkPermission();

    if (status == LocationPermission.whileInUse) {
      _isPermissionEnabled = true;
      notifyListeners();
    }
  }

  void handleLocalizationToggle(bool value) async {
    if (value) {
      requestPermission();
    } else {
      Geolocator.openAppSettings();
    }
  }

  Future<void> requestPermission() async {
    LocationPermission status = await Geolocator.checkPermission();

    if (status == LocationPermission.deniedForever ||
        _permissionDeniedCount > 1) {
      await Geolocator.openAppSettings();
    } else {
      await Geolocator.requestPermission();
    }

    status = await Geolocator.checkPermission();
    _permissionDeniedCount =
        status == LocationPermission.denied ? _permissionDeniedCount + 1 : 0;

    _isPermissionEnabled = status == LocationPermission.whileInUse;
    notifyListeners();
  }

  Future<UserLocation> getUserLocation() async {
    final LocationPermission status = await Geolocator.checkPermission();

    if (status == LocationPermission.whileInUse) {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      debugPrint('LATITUDE: ${position.latitude}');
      debugPrint('LONGITUDE: ${position.longitude}');
      return UserLocation(
        city: 'São Paulo',
        state: 'São Paulo',
      );
    } else {
      // Default city and state
      return UserLocation(
        city: 'Goiânia',
        state: 'Goiás',
      );
    }
  }
}
