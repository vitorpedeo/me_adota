import 'package:flutter/material.dart';
import 'package:me_adota/app.dart';
import 'package:me_adota/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();

  runApp(const App());
}
