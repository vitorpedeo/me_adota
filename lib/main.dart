import 'package:flutter/material.dart';
import 'package:me_adota/app.dart';
import 'package:me_adota/injection_container.dart';
import 'package:me_adota/src/shared/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();

  await LocalStorageService.init();

  runApp(const App());
}
