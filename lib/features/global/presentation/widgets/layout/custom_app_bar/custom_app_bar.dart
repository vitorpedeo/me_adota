import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_leading.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PhosphorIconData? icon;

  const CustomAppBar({super.key, this.title = 'Me Adota', this.icon});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.bodyBold.copyWith(
          color: AppTheme.bodyText,
        ),
      ),
      leading: CustomLeading(
        icon: icon,
      ),
      backgroundColor: AppTheme.white,
      centerTitle: false,
      elevation: 0,
    );
  }
}
