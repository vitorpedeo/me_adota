import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/pet_card.dart';

class NewPetsList extends StatelessWidget {
  const NewPetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Novos amigos cadastrados',
          style: AppTheme.headlineSecondaryBold.copyWith(
            color: AppTheme.headText,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: LayoutGrid(
            columnSizes: [
              184.px,
              184.px,
              184.px,
            ],
            rowSizes: const [
              auto,
            ],
            columnGap: 16,
            children: List.generate(
              3,
              (index) => const PetCard(),
            ),
          ),
        )
      ],
    );
  }
}
