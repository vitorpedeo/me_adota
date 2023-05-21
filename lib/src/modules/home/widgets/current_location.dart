import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/home/controllers/home_controller.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          Consumer<HomeController>(builder: (context, controller, child) {
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
