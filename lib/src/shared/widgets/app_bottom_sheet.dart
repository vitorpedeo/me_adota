import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> actions;

  const AppBottomSheet(
      {super.key,
      required this.title,
      this.description,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          if (description != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  description!,
                  style: AppTheme.bodyRegular.copyWith(
                    color: AppTheme.bodyText,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          if (actions.isNotEmpty)
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
    );
  }
}
