import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final int id;
  final String abbreviation;
  final String name;

  const StateEntity({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  @override
  List<Object> get props => [
        id,
        name,
        abbreviation,
      ];
}
