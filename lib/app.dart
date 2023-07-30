import 'package:flutter/material.dart';

import 'features/onboard/presentation/pages/onboard_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: AppProviders.all,
  //     child: MaterialApp.router(
  //       title: 'Me Adota',
  //       routerConfig: AppRouter.getRouter(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Me Adota',
      home: OnboardPage(),
    );
  }
}
