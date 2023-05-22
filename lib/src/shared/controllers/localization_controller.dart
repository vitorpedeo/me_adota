import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/models/user_location_model.dart';

class LocalizationController extends ChangeNotifier {
  UserLocation _userLocation = UserLocation(
    city: 'Goiânia',
    state: 'Goiás',
  );

  UserLocation get userLocation => _userLocation;

  LocalizationController();
}
