import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_adota/src/modules/onboard/models/onboarding_content_model.dart';
import 'package:me_adota/src/shared/styles/svgs.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

final List<OnboardingContent> onboardContentList = [
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

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            bottom: 48,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity:
                        _currentPage == onboardContentList.length - 1 ? 0 : 1,
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint('Pular');
                      },
                      child: Text(
                        'Pular',
                        style: AppTheme.buttonMedium.copyWith(
                          color: AppTheme.bodySecondaryText,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemCount: onboardContentList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          onboardContentList[index].image,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Column(
                          children: [
                            Text(
                              onboardContentList[index].title,
                              style: AppTheme.headlineBold.copyWith(
                                color: AppTheme.headText,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              onboardContentList[index].description,
                              style: AppTheme.bodyRegular.copyWith(
                                color: AppTheme.bodyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: List.generate(
                      onboardContentList.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        margin: EdgeInsets.only(
                          right: 6,
                        ),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppTheme.pink
                              : AppTheme.pinkAlpha,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage != onboardContentList.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.pink,
                      fixedSize: const Size(56, 56),
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      _currentPage == onboardContentList.length - 1
                          ? Icons.check
                          : Icons.arrow_right_alt_rounded,
                      color: AppTheme.white,
                      size: 28,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
