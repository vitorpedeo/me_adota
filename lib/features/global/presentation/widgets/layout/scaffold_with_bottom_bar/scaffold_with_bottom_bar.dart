import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/config/theme/app_theme.dart';

part 'bottom_bar_item.dart';

class ScaffoldWithBottomBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomBar({super.key, required this.child});

  @override
  State<ScaffoldWithBottomBar> createState() => _ScaffoldWithBottomBarState();
}

class _ScaffoldWithBottomBarState extends State<ScaffoldWithBottomBar> {
  final List<BottomBarItem> tabs = [
    BottomBarItem(
      path: AppRoutes.home.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.house(
            PhosphorIconsStyle.bold,
          ),
        ),
      ),
      label: 'Início',
    ),
    BottomBarItem(
      path: AppRoutes.search.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.magnifyingGlass(
            PhosphorIconsStyle.bold,
          ),
        ),
      ),
      label: 'Pesquisar',
    ),
    BottomBarItem(
      path: AppRoutes.adoptions.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.handHeart(
            PhosphorIconsStyle.bold,
          ),
        ),
      ),
      label: 'Adoções',
    ),
    BottomBarItem(
      path: AppRoutes.account.path,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: PhosphorIcon(
          PhosphorIcons.user(
            PhosphorIconsStyle.bold,
          ),
        ),
      ),
      label: 'Conta',
    ),
  ];

  int get _currentIndex => _locationToTabIndex(
        GoRouterState.of(context).uri.toString(),
      );

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
