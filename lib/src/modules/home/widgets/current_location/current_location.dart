import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/home/controllers/home_controller.dart';
import 'package:me_adota/src/modules/home/widgets/current_location/current_location_controller.dart';
import 'package:me_adota/src/shared/constants/brazil_states_constant.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_bottom_sheet.dart';
import 'package:me_adota/src/shared/widgets/app_button.dart';
import 'package:me_adota/src/shared/widgets/app_dialog_select/app_dialog_select.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void _showChangeLocationBottomSheet(BuildContext context) {
    final controller = context.read<CurrentLocationController>();

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AppBottomSheet(
          title: 'Minha localização',
          content: Row(
            children: [
              Expanded(
                child: AppDialogSelect<String>(
                  label: 'Estado',
                  options: BrazilStates.all,
                  onSelect: (value) {
                    controller.selectedState = value;
                    controller.fetchCities();
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Consumer<CurrentLocationController>(
                    builder: (context, controller, child) {
                  return AppDialogSelect<String>(
                    label: 'Cidade',
                    options: controller.cityOptions,
                    onSelect: (value) {
                      controller.selectedCity = value;
                    },
                  );
                }),
              ),
            ],
          ),
          actions: [
            AppButton(
              text: 'Confirmar',
              onPressed: () {
                controller.confirm();

                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppTheme.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showChangeLocationBottomSheet(context);
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
          Consumer<LocalizationController>(
              builder: (context, controller, child) {
            return RichText(
              text: TextSpan(
                text: '${controller.userLocation.city},',
                style: AppTheme.bodySecondaryBold.copyWith(
                  color: AppTheme.bodyText,
                ),
                children: [
                  TextSpan(
                    text: ' ${controller.userLocation.state}',
                    style: AppTheme.bodySecondaryRegular.copyWith(
                      color: AppTheme.bodyText,
                    ),
                  ),
                ],
              ),
            );
          }),
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
}
