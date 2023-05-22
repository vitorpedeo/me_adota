import 'package:flutter/material.dart';
import 'package:me_adota/src/core/services/local_storage_service.dart';
import 'package:me_adota/src/modules/onboard/models/onboarding_content_model.dart';
import 'package:me_adota/src/shared/styles/svgs.dart';

class OnboardController extends ChangeNotifier {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final List<OnboardingContent> _onboardContentList = [
    OnboardingContent(
      title: 'Adote um amigo peludo hoje mesmo',
      description:
          'Encontre o seu próximo companheiro de quatro patas com a ajuda do Me Adota!',
      image: AppSvgs.dog1,
    ),
    OnboardingContent(
      title: 'Sem complicações, sem burocracia',
      description:
          'Nosso app torna o processo de adoção rápido e fácil. Preencha seu perfil, encontre o animal que deseja adotar, e pronto! ',
      image: AppSvgs.dog2,
    ),
    OnboardingContent(
      title: 'Encontre pets mais próximos de você',
      description:
          'O Me Adota facilita a encontrar animais mais próximos da sua região!',
      image: AppSvgs.cat1,
    ),
  ];
  int _currentPageIndex = 0;

  OnboardController();

  PageController get pageController => _pageController;
  List<OnboardingContent> get onboardContentList => _onboardContentList;
  int get currentPageIndex => _currentPageIndex;
  int get pagesQuantity => _onboardContentList.length;
  bool get isLastPage => _currentPageIndex == _onboardContentList.length - 1;

  void changePage(int newPage) {
    _currentPageIndex = newPage;
    notifyListeners();
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  Future<void> updateFirstTimeAccess({bool? value}) async {
    await LocalStorageService.setBool(Keys.isFirstTime, value ?? false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
