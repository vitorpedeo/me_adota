import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/widgets/app_bottom_sheet.dart';
import 'package:me_adota/src/shared/widgets/app_button.dart';

Future<dynamic> showLocalizationWarning(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => AppBottomSheet(
      title: 'Permissão de localização',
      description:
          'Para que possamos encontrar animais próximos a você, precisamos da sua permissão para acessar sua localização.',
      actions: [
        AppButton(
          text: 'Ignorar',
          variant: AppButtonVariant.secondary,
          onPressed: () {},
        ),
        AppButton(
          text: 'Permitir',
          onPressed: () {},
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
