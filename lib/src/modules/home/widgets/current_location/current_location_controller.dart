import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/home/controllers/home_controller.dart';
import 'package:me_adota/src/shared/models/option_model.dart';
import 'package:me_adota/src/shared/models/user_location_model.dart';
import 'package:me_adota/src/shared/services/localities_http_service.dart';

class CurrentLocationController extends ChangeNotifier {
  String? _selectedState;
  String? _selectedCity;
  List<Option<String>> _cityOptions = [];

  final LocalitiesHttpService localitiesHttpService;
  final HomeController homeController;

  CurrentLocationController({
    required this.localitiesHttpService,
    required this.homeController,
  });

  List<Option<String>> get cityOptions => _cityOptions;

  set selectedState(String? value) {
    _selectedState = value;
  }

  set selectedCity(String? value) {
    _selectedCity = value;
  }

  Future<void> fetchCities() async {
    if (_selectedState == null) {
      return;
    }

    await localitiesHttpService.getCitiesByState(
      state: _selectedState!,
    );

    _cityOptions = [
      Option(
        label: 'São Paulo',
        value: 'São Paulo',
      ),
    ];
    notifyListeners();
  }

  void confirm() {
    if (_selectedCity == null || _selectedState == null) {
      return;
    }

    homeController.localizationController.updateUserLocation(
      UserLocation(
        city: _selectedCity!,
        state: _selectedState!,
      ),
    );

    homeController.loadHome();
  }
}
