import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/custom_bottom_sheet.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/dialog_select.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/presentation/cubits/cities_list/cities_list_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/current_location/current_location_cubit.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
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
                PhosphorIcons.mapPin(
                  PhosphorIconsStyle.bold,
                ),
                size: 20,
                color: AppTheme.pink,
              ),
              const SizedBox(
                width: 8,
              ),
              BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
                  builder: (context, state) {
                if (state.selectedCity == null || state.selectedState == null) {
                  return Text(
                    'Minha localização',
                    style: AppTheme.bodySecondaryBold.copyWith(
                      color: AppTheme.bodyText,
                    ),
                  );
                }

                return RichText(
                  text: TextSpan(
                    text: '${state.selectedCity?.name}',
                    style: AppTheme.bodySecondaryBold.copyWith(
                      color: AppTheme.bodyText,
                    ),
                    children: [
                      TextSpan(
                        text: ', ${state.selectedState?.abbreviation}',
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
                PhosphorIcons.caretRight(
                  PhosphorIconsStyle.bold,
                ),
                size: 20,
                color: AppTheme.bodyText,
              ),
            ],
          ),
        ),
      ],
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
              builder: (context, statesListState) {
                if (statesListState is StatesListLoading) {
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

                if (statesListState is StatesListError) {
                  return Text(statesListState.message);
                }

                if (statesListState is StatesListLoaded) {
                  return BlocBuilder<CurrentLocationCubit,
                          CurrentLocationState>(
                      builder: (context, currentLocationState) {
                    return DialogSelect<StateEntity>(
                      hintText: 'UF',
                      selectedItem: currentLocationState.state,
                      items: statesListState.states,
                      shownValue: (state) => state.abbreviation,
                      onChanged: (state) {
                        final currentLocationCubit =
                            context.read<CurrentLocationCubit>();

                        if (state != null) {
                          currentLocationCubit.selectState(state);
                          currentLocationCubit.resetCity();

                          final citiesListCubit =
                              context.read<CitiesListCubit>();

                          citiesListCubit.fetchCitiesByState(state);
                        }
                      },
                    );
                  });
                }

                return const SizedBox.shrink();
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<CitiesListCubit, CitiesListState>(
              builder: (context, citiesListState) {
                if (citiesListState is CitiesListLoading) {
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

                if (citiesListState is CitiesListError) {
                  return Text(citiesListState.message);
                }

                if (citiesListState is CitiesListInitial ||
                    citiesListState is CitiesListLoaded) {
                  return BlocBuilder<CurrentLocationCubit,
                          CurrentLocationState>(
                      builder: (context, currentLocationState) {
                    return DialogSelect<CityEntity>(
                      hintText: 'Cidade',
                      selectedItem: currentLocationState.city,
                      items: citiesListState is CitiesListLoaded
                          ? citiesListState.cities
                          : [],
                      shownValue: (city) => city.name,
                      onChanged: (city) {
                        final currentLocationCubit =
                            context.read<CurrentLocationCubit>();

                        if (city != null) {
                          currentLocationCubit.selectCity(city);
                        }
                      },
                    );
                  });
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      actions: [
        BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
            builder: (context, state) {
          final isButtonEnabled = state.state != null && state.city != null;

          return AppButton(
            text: 'Confirmar',
            onPressed: !isButtonEnabled
                ? null
                : () async {
                    final currentLocationCubit =
                        context.read<CurrentLocationCubit>();

                    await currentLocationCubit.saveLocation();

                    if (context.mounted) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                  },
          );
        }),
      ],
    );
  }
}
