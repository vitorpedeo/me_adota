import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:me_adota/src/core/services/local_storage_service.dart';
import 'package:me_adota/src/modules/onboard/models/onboarding_content_model.dart';
import 'package:me_adota/src/modules/onboard/widgets/localization_switcher.dart';
import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:me_adota/src/shared/styles/svgs.dart';

class OnboardController extends ChangeNotifier {
  final LocalizationController localizationController;
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

  OnboardController({required this.localizationController});

  PageController get pageController => _pageController;
  List<OnboardingContent> get onboardContentList => _onboardContentList;
  int get currentPageIndex => _currentPageIndex;
  int get pagesQuantity => _onboardContentList.length;
  bool get isLastPage => _currentPageIndex == _onboardContentList.length - 1;
  bool get isLocalizationEnabled => localizationController.isPermissionEnabled;

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

  Future<bool> canSkipOnboard() async {
    final LocationPermission status = await Geolocator.checkPermission();

    if ((status == LocationPermission.denied ||
            status == LocationPermission.deniedForever) &&
        localizationController.permissionDeniedCount < 1) {
      return false;
    } else {
      await updateFirstTimeAccess(
        value: false,
      );
      return true;
    }
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
