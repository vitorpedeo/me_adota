import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/custom_bottom_sheet.dart';
import 'package:me_adota/features/global/presentation/widgets/select_menu.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showLocationChangeBottomSheet(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIcons.bold.mapPin,
            size: 20,
            color: AppTheme.pink,
          ),
          const SizedBox(
            width: 8,
          ),
          RichText(
            text: TextSpan(
              text: 'Goiânia,',
              style: AppTheme.bodySecondaryBold.copyWith(
                color: AppTheme.bodyText,
              ),
              children: [
                TextSpan(
                  text: ' GO',
                  style: AppTheme.bodySecondaryRegular.copyWith(
                    color: AppTheme.bodyText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          PhosphorIcon(
            PhosphorIcons.bold.caretRight,
            size: 20,
            color: AppTheme.bodyText,
          ),
        ],
      ),
    );
  }

  void _showLocationChangeBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      title: 'Minha localização',
      content: Row(
        children: const [
          Expanded(
            child: SelectMenu(
              hintText: 'UF',
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 2,
            child: SelectMenu(
              hintText: 'Cidade',
            ),
          ),
        ],
      ),
      actions: [
        AppButton(
          text: 'Confirmar',
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ],
    );
  }
}
