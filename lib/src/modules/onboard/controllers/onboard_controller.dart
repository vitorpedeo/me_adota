import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/onboard/models/onboarding_content_model.dart';
import 'package:me_adota/src/shared/styles/svgs.dart';

class OnboardController extends ChangeNotifier {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final List<OnboardingContent> _onboardContentList = [
    OnboardingContent(
      title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec',
      image: AppSvgs.dog1,
    ),
    OnboardingContent(
      title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec',
      image: AppSvgs.dog2,
    ),
    OnboardingContent(
      title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec',
      image: AppSvgs.cat1,
    ),
  ];
  int _currentPageIndex = 0;

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
