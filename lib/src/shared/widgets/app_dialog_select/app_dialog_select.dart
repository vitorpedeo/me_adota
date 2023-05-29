import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_dialog_select/app_dialog.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/**
 *  TODO: Implement AppDialogSelect. Use this video as a reference:
 *   https://www.youtube.com/watch?v=Ldg_TO988no
 */

class AppDialogSelect extends StatelessWidget {
  final String label;

  const AppDialogSelect({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialog(context),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 48,
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTheme.bodySecondaryRegular.copyWith(
                color: AppTheme.bodySecondaryText,
              ),
            ),
            PhosphorIcon(
              PhosphorIcons.regular.caretDown,
              color: AppTheme.bodySecondaryText,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return const AppDialog();
      },
    );
  }
}
