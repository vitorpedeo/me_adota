import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AdoptionsPage extends StatelessWidget {
  const AdoptionsPage({super.key});

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
          child: Center(
            child: Text(
              'Adoptions Page',
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
