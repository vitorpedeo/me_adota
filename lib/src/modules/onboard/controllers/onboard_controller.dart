import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/models/onboarding_content_model.dart';
import 'package:me_adota/src/modules/onboard/widgets/localization_switcher.dart';
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
          'Permita que o Me Adota acesse sua localização e encontre animais próximos a você.',
      image: AppSvgs.cat1,
      extraWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 16,
          ),
          LocalizationSwitcher(),
        ],
      ),
    ),
  ];
  int _currentPageIndex = 0;
  bool _hasLocationPermission = false;

  PageController get pageController => _pageController;
  List<OnboardingContent> get onboardContentList => _onboardContentList;
  int get currentPageIndex => _currentPageIndex;
  bool get hasLocationPermission => _hasLocationPermission;
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

  void handleLocationPermission(bool value) {
    _hasLocationPermission = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
