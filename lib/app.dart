import 'package:flutter/material.dart';
import 'package:me_adota/providers.dart';
import 'package:me_adota/src/modules/onboard/pages/onboard_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.all,
      child: const MaterialApp(
        title: 'Me Adota',
        home: OnboardPage(),
      ),
    );
  }
}
