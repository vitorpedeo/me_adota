import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_svgs.dart';
import 'package:me_adota/config/theme/app_theme.dart';
import 'package:me_adota/features/account/presentation/cubits/my_pets/my_pets_cubit.dart';
import 'package:me_adota/features/global/presentation/widgets/helpers/pet_card.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/custom_app_bar/custom_app_bar.dart';
import 'package:me_adota/features/global/presentation/widgets/primitives/app_button.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const CustomAppBar(
        title: 'Meus pets',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(
                top: 32,
                right: 32,
                left: 32,
              ),
              width: double.infinity,
              child: BlocBuilder<MyPetsCubit, MyPetsState>(
                builder: (context, state) {
                  if (state is MyPetsInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is MyPetsLoaded) {
                    return state.pets.isNotEmpty
                        ? LayoutGrid(
                            columnSizes: [1.fr, 1.fr],
                            rowSizes: const [
                              auto,
                              auto,
                              auto,
                              auto,
                            ],
                            columnGap: 12,
                            rowGap: 12,
                            children: List.generate(
                              8,
                              (index) => const PetCard(),
                            ),
                          )
                        : Column(
                            children: [
                              SvgPicture.asset(
                                AppSvgs.dog5,
                                height: 340,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                'Opa, você ainda não cadastrou nenhum pet!',
                                style: AppTheme.headlineBold.copyWith(
                                  color: AppTheme.headText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              AppButton(
                                text: 'Cadastrar agora',
                                onPressed: () {
                                  context.goNamed(AppRoutes.createPet.name);
                                },
                              ),
                            ],
                          );
                  }

                  return const SizedBox.shrink();
                },
              )),
        ),
      ),
    );
  }
}
