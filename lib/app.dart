import 'package:flutter/material.dart';
import 'package:me_adota/config/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Me Adota',
      routerConfig: AppRouter.getRouter(),
    );
  }
}
