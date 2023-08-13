import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/app_carousel.dart';
import 'package:me_adota/features/home/infra/models/species_filter.dart';
import 'package:me_adota/features/home/presentation/cubits/pets_by_species/pets_by_species_cubit.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PetsBySpecies extends StatelessWidget {
  const PetsBySpecies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Por espécie',
          style: AppTheme.headlineSecondaryBold.copyWith(
            color: AppTheme.headText,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<PetsBySpeciesCubit, PetsBySpeciesState>(
            builder: (context, state) {
          return AppCarousel(
            children: state.filters.map((filter) {
              final bool isActive = state.selectedFilter == filter;

              return _buildSpeciesFilterButton(context, filter, isActive);
            }).toList(),
          );
        }),
      ],
    );
  }

  Widget _buildSpeciesFilterButton(
      BuildContext context, SpeciesFilterModel filter, bool isActive) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<PetsBySpeciesCubit>();

        cubit.changeFilter(filter);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? AppTheme.pink : AppTheme.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            24,
          ),
          color: isActive ? AppTheme.pink : AppTheme.white,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xFFFF316B) : AppTheme.gray,
              ),
              child: Center(
                child: PhosphorIcon(
                  filter.icon,
                  color: isActive ? AppTheme.white : AppTheme.bodyText,
                  size: 14,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              filter.name,
              style: AppTheme.bodySecondaryMedium.copyWith(
                color: isActive ? AppTheme.white : AppTheme.bodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
