import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
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
      icon: PhosphorIcon(
        PhosphorIcons.regular.houseSimple,
      ),
      label: 'Início',
    ),
    NavbarItem(
      path: AppRoutesConfig.search.path,
      icon: PhosphorIcon(
        PhosphorIcons.regular.magnifyingGlassMinus,
      ),
      label: 'Pesquisar',
    ),
    NavbarItem(
      path: AppRoutesConfig.adoptions.path,
      icon: PhosphorIcon(
        PhosphorIcons.regular.handHeart,
      ),
      label: 'Adoções',
    ),
    NavbarItem(
      path: AppRoutesConfig.account.path,
      icon: PhosphorIcon(
        PhosphorIcons.regular.person,
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
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (tabIndex) => _onItemTapped(tabIndex),
      ),
    );
  }
}
