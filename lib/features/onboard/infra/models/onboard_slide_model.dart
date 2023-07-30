import 'package:flutter/material.dart';

class OnboardSlideModel {
  final String title;
  final String description;
  final String image;
  final Widget? extraWidget;

  OnboardSlideModel({
    required this.title,
    required this.description,
    required this.image,
    this.extraWidget,
  });
}
