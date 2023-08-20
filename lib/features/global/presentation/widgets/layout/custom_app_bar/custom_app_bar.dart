import 'package:flutter/material.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_leading.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Me Adota'),
      leading: const CustomLeading(),
    );
  }
}
