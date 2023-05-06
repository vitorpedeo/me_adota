import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              'Me Adota',
              style: AppTheme.headlineBold.copyWith(
                color: AppTheme.headText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
