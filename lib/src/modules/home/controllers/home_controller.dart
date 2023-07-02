import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/models/user_location_model.dart';

enum HomeState {
  idle,
  loading,
  success,
  error,
}

class HomeController extends ChangeNotifier {
  HomeState _status = HomeState.idle;

  final LocalizationController localizationController;

  HomeController({
    required this.localizationController,
  });

  HomeState get status => _status;
  UserLocation get userLocation => localizationController.userLocation;

  Future<void> loadHome() async {
    try {
      _status = HomeState.loading;
      notifyListeners();

      debugPrint(
          'loading home for ${localizationController.userLocation.city} - ${localizationController.userLocation.state}');

      _status = HomeState.success;
      notifyListeners();
    } catch (e) {
      _status = HomeState.error;
      notifyListeners();
    }
  }
}
