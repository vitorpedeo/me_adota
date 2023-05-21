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
  late UserLocation _userLocation;

  final LocalizationController localizationController;

  HomeController({
    required this.localizationController,
  });

  HomeState get status => _status;
  UserLocation get userLocation => _userLocation;

  Future<void> loadHome() async {
    try {
      _status = HomeState.loading;
      _userLocation = await localizationController.getUserLocation();
      _status = HomeState.success;
    } catch (e) {
      _status = HomeState.error;
    } finally {
      notifyListeners();
    }
  }
}
