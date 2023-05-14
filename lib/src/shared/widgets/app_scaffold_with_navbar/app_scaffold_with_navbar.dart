import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:me_adota/src/shared/widgets/app_scaffold_with_navbar/navbar_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppScaffoldWithNavbar extends StatefulWidget {
  final Widget child;

  const AppScaffoldWithNavbar({super.key, required this.child});

  @override
  State<AppScaffoldWithNavbar> createState() => _AppScaffoldWithNavbarState();
}

class _AppScaffoldWithNavbarState extends State<AppScaffoldWithNavbar> {
  final List<NavbarItem> tabs = [
    NavbarItem(
      path: AppRoutesConfig.home.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.bold.house,
        ),
      ),
      label: 'Início',
    ),
    NavbarItem(
      path: AppRoutesConfig.search.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.bold.magnifyingGlass,
        ),
      ),
      label: 'Pesquisar',
    ),
    NavbarItem(
      path: AppRoutesConfig.adoptions.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.bold.handHeart,
        ),
      ),
      label: 'Adoções',
    ),
    NavbarItem(
      path: AppRoutesConfig.account.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.bold.user,
        ),
      ),
      label: 'Conta',
    ),
  ];

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final int index = tabs.indexWhere(
      (element) => location.startsWith(element.path),
    );

    return index < 0 ? 0 : index;
  }

  void _onItemTapped(int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.white,
        selectedItemColor: AppTheme.pink,
        selectedIconTheme: const IconThemeData(
          size: 24,
        ),
        selectedLabelStyle: AppTheme.overlineBold.copyWith(
          color: AppTheme.pink,
        ),
        unselectedItemColor: AppTheme.bodySecondaryText,
        unselectedIconTheme: const IconThemeData(
          size: 24,
        ),
        unselectedLabelStyle: AppTheme.overlineBold.copyWith(
          color: AppTheme.bodySecondaryText,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (tabIndex) => _onItemTapped(tabIndex),
      ),
    );
  }
}
