import 'package:flutter/material.dart';

class OnboardingContent {
  final String title;
  final String description;
  final String image;
  final Widget? extraWidget;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
    this.extraWidget,
  });
}
