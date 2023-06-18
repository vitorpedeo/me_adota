import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/models/option_model.dart';
import 'package:me_adota/src/shared/widgets/app_text_input.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppDialog<T> extends StatelessWidget {
  final List<Option<T>> options;

  const AppDialog({
    super.key,
    this.options = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Selecione uma opção',
        style: AppTheme.headlineSecondaryBold.copyWith(
          color: AppTheme.headText,
          fontSize: 18,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppTextInput(),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          debugPrint('Value: ${options[index].value}');
                        },
                        child: Ink(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 240, 235, 235),
                                width: 1,
                              ),
                            ),
                          ),
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
                                    options[index].label,
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
        ),
      ),
    );
  }
}
