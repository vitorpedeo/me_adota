import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const AppCarousel({
    super.key,
    required this.children,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
          children: List.generate(
        children.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: index == children.length - 1 ? 0 : spacing,
          ),
          child: children[index],
        ),
      )),
    );
  }
}
