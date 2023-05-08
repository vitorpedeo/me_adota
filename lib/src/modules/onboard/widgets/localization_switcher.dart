import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class LocalizationSwitcher extends StatelessWidget {
  const LocalizationSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(
          color: AppTheme.gray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Acesso à localização',
            style: AppTheme.bodyRegular.copyWith(
              color: AppTheme.bodySecondaryText,
              height: 1,
            ),
          ),
          Container(
            height: 32,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Consumer<LocalizationController>(
                builder: (context, controller, child) {
                  return CupertinoSwitch(
                    activeColor: AppTheme.pink,
                    value: controller.isEnabled,
                    onChanged: (newValue) {
                      controller.handleLocalizationToggle(newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
