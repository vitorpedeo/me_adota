import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/global/presentation/widgets/app_carousel.dart';
import 'package:me_adota/features/global/presentation/widgets/pet_card.dart';

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
        AppCarousel(
          children: List.generate(
            3,
            (index) => const PetCard(),
          ),
        ),
      ],
    );
  }
}
