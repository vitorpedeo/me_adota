part of 'scaffold_with_bottom_bar.dart';

class BottomBarItem extends BottomNavigationBarItem {
  final String path;

  const BottomBarItem({required this.path, required Widget icon, String? label})
      : super(
          icon: icon,
          label: label,
        );
}
