import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/home/presentation/widgets/current_location.dart';
import 'package:me_adota/features/home/presentation/widgets/main_banner.dart';
import 'package:me_adota/features/home/presentation/widgets/new_pets_list.dart';
import 'package:me_adota/features/home/presentation/widgets/pets_by_species.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CurrentLocation(),
                SizedBox(
                  height: 48,
                ),
                MainBanner(),
                SizedBox(
                  height: 48,
                ),
                NewPetsList(),
                SizedBox(
                  height: 48,
                ),
                PetsBySpecies(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
