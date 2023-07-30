import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_svgs.dart';
import 'package:me_adota/features/onboard/infra/models/onboard_slide_model.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final List<OnboardSlideModel> _onboardSlides = [
    OnboardSlideModel(
      title: 'Adote um amigo peludo hoje mesmo',
      description:
          'Encontre o seu próximo companheiro de quatro patas com a ajuda do Me Adota!',
      image: AppSvgs.dog1,
    ),
    OnboardSlideModel(
      title: 'Sem complicações, sem burocracia',
      description:
          'Nosso app torna o processo de adoção rápido e fácil. Preencha seu perfil, encontre o animal que deseja adotar, e pronto! ',
      image: AppSvgs.dog2,
    ),
    OnboardSlideModel(
      title: 'Encontre pets mais próximos de você',
      description:
          'O Me Adota facilita a encontrar animais mais próximos da sua região!',
      image: AppSvgs.cat1,
    ),
  ];

  OnboardCubit() : super(const OnboardInitial());

  PageController get pageController => _pageController;
  List<OnboardSlideModel> get onboardSlides => _onboardSlides;
  int get currentSlide => state.currentSlide;
  int get slidesQuantity => _onboardSlides.length;
  bool get isLastSlide => state.currentSlide == _onboardSlides.length - 1;

  void changePage(int newPage) {
    emit(OnboardPageChanged(newPage));
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    emit(OnboardPageChanged(currentSlide + 1));
  }
}
