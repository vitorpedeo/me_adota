import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/custom_bottom_sheet.dart';
import 'package:me_adota/features/global/presentation/widgets/dialog_select.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final statesListCubit = context.read<StatesListCubit>();

        statesListCubit.fetchStates();

        _showLocationChangeBottomSheet(context);
      },
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
          RichText(
            text: TextSpan(
              text: 'Goiânia,',
              style: AppTheme.bodySecondaryBold.copyWith(
                color: AppTheme.bodyText,
              ),
              children: [
                TextSpan(
                  text: ' GO',
                  style: AppTheme.bodySecondaryRegular.copyWith(
                    color: AppTheme.bodyText,
                  ),
                ),
              ],
            ),
          ),
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

  void _showLocationChangeBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      title: 'Minha localização',
      content: Row(
        children: [
          Expanded(
            child: BlocBuilder<StatesListCubit, StatesListState>(
              builder: (context, state) {
                if (state is StatesListLoading) {
                  return Shimmer.fromColors(
                    baseColor: const Color(0xFFEBEBF4),
                    highlightColor: const Color(0xFFF4F4F4),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBEBF4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }

                if (state is StatesListError) {
                  return Text(state.message);
                }

                if (state is StatesListLoaded) {
                  return DialogSelect<StateEntity>(
                    hintText: 'UF',
                    items: state.states,
                    shownValue: (state) => state.abbreviation,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Expanded(
            flex: 2,
            child: DialogSelect(
              hintText: 'Cidade',
            ),
          ),
        ],
      ),
      actions: [
        AppButton(
          text: 'Confirmar',
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ],
    );
  }
}
