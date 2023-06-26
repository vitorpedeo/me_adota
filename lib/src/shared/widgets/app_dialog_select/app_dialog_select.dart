import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_dialog_select/app_dialog.dart';
import 'package:me_adota/src/shared/models/option_model.dart';
import 'package:me_adota/src/shared/widgets/app_text_input.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/**
 *  TODO: Implement AppDialogSelect. Use this video as a reference:
 *   https://www.youtube.com/watch?v=Ldg_TO988no
 */

class AppDialogSelect<T> extends StatelessWidget {
  final String label;
  final List<Option<T>> options;

  const AppDialogSelect({
    super.key,
    required this.label,
    this.options = const [],
  });

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
        List<Option<T>> filteredOptions = options;

        return AppDialog(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  AppTextInput(
                    hintText: 'Filtrar opções',
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          filteredOptions = options;
                        });

                        return;
                      }

                      setState(() {
                        filteredOptions = options
                            .where((element) => element.label
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                        itemCount: filteredOptions.length,
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              color: Color.fromARGB(255, 240, 235, 235),
                            ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              debugPrint(
                                  'Value: ${filteredOptions[index].value}');
                            },
                            child: Ink(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PhosphorIcon(
                                        PhosphorIcons.bold.mapPin,
                                        size: 20,
                                        color: AppTheme.pink,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        filteredOptions[index].label,
                                        style: AppTheme.bodyRegular.copyWith(
                                          color: AppTheme.bodyText,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  PhosphorIcon(
                                    PhosphorIcons.bold.caretRight,
                                    size: 20,
                                    color: AppTheme.pink,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
