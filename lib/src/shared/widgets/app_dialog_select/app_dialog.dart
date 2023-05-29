import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Selecione uma opção',
        style: AppTheme.headlineSecondaryBold.copyWith(
          color: AppTheme.headText,
          fontSize: 18,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('SEARCH HERE'),
              SizedBox(
                height: 16,
              ),
              Text('LIST HERE')
            ],
          ),
        ),
      ),
    );
  }
}
