import 'package:flutter/material.dart';

class NavbarItem extends BottomNavigationBarItem {
  final String path;

  const NavbarItem({required this.path, required Widget icon, String? label})
      : super(
          icon: icon,
          label: label,
        );
}
