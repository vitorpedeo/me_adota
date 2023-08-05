import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/home/presentation/widgets/current_location.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            bottom: 48,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: const [
              CurrentLocation(),
            ],
          ),
        ),
      ),
    );
  }
}
