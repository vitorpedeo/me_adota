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

class AppDialogSelect<T> extends StatefulWidget {
  final String label;
  final List<Option<T>> options;

  const AppDialogSelect({
    super.key,
    required this.label,
    this.options = const [],
  });

  @override
  State<AppDialogSelect<T>> createState() => _AppDialogSelectState<T>();
}

class _AppDialogSelectState<T> extends State<AppDialogSelect<T>> {
  List<Option<T>> _allOptions = [];
  List<Option<T>> _filteredOptions = [];

  @override
  void initState() {
    super.initState();

    _allOptions = widget.options;
    _filteredOptions = widget.options;
  }

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
              widget.label,
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
        return AppDialog(
          child: Column(
            children: [
              AppTextInput(
                hintText: 'Filtrar opções',
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      _filteredOptions = _allOptions;
                    });

                    return;
                  }

                  setState(() {
                    _filteredOptions = _allOptions
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
                    itemCount: _filteredOptions.length,
                    separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 240, 235, 235),
                        ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          debugPrint('Value: ${_filteredOptions[index].value}');
                        },
                        child: Ink(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    widget.options[index].label,
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
          ),
        );
      },
    );
  }
}
