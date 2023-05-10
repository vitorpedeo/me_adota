import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_bottom_sheet.dart';

Future<dynamic> showLocalizationWarning(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => AppBottomSheet(
      title: 'Permissão de localização',
      description:
          'Para que possamos encontrar animais próximos a você, precisamos da sua permissão para acessar sua localização.',
      actions: [
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: AppTheme.pinkAlpha,
          ),
          child: Text(
            'Ignorar',
            style: AppTheme.bodyRegular.copyWith(
              color: AppTheme.bodyText,
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(color: AppTheme.pink),
          child: Text(
            'Permitir',
            style: AppTheme.bodyRegular.copyWith(
              color: AppTheme.bodyText,
            ),
          ),
        ),
      ],
    ),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
  );
}
