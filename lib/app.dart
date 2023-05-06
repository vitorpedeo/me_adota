import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/pages/onboard_page.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardPage(),
    );
  }
}
