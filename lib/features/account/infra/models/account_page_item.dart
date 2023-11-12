import 'package:equatable/equatable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountPageItem extends Equatable {
  final String title;
  final PhosphorFlatIconData icon;
  final String link;

  const AccountPageItem({
    required this.title,
    required this.icon,
    required this.link,
  });

  @override
  List<Object> get props => [
        title,
        icon,
        link,
      ];
}
