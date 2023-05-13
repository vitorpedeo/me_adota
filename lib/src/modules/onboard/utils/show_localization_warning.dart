import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/widgets/app_bottom_sheet.dart';
import 'package:me_adota/src/shared/widgets/app_button.dart';
import 'package:provider/provider.dart';

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
          onPressed: () {
            if (context.mounted) {
              Navigator.of(context).pop();
              context.goNamed(
                AppRoutesConfig.home.name,
              );
            }
          },
        ),
        AppButton(
          text: 'Permitir',
          onPressed: () async {
            final controller = context.read<LocalizationController>();

            await controller.requestPermission();

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
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
