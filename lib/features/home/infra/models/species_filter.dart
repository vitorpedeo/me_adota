import 'package:equatable/equatable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SpeciesFilterModel extends Equatable {
  final String name;
  final PhosphorIconData icon;

  const SpeciesFilterModel({
    required this.name,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        name,
        icon,
      ];
}
