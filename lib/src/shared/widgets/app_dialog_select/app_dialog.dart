import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AppDialog<T> extends StatelessWidget {
  final Widget child;

  const AppDialog({
    super.key,
    required this.child,
  });

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
          child: child,
        ),
      ),
    );
  }
}
