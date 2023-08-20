import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    Widget? content,
    List<Widget>? actions,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.only(
          top: 16,
          right: 32,
          bottom: 32,
          left: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.gray,
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: AppTheme.headlineSecondaryBold.copyWith(
                color: AppTheme.headText,
              ),
            ),
            if (content != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  content,
                ],
              ),
            if (actions != null && actions.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: actions.map((action) {
                      if (actions.indexOf(action) >= 1) {
                        return Expanded(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: action,
                              ),
                            ],
                          ),
                        );
                      }

                      return Expanded(
                        child: action,
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
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
}
