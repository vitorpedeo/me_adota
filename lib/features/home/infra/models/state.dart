import 'package:me_adota/features/home/domain/entities/state.dart';

class StateModel extends StateEntity {
  const StateModel({
    required int id,
    required String abbreviation,
    required String name,
  }) : super(
          id: id,
          abbreviation: abbreviation,
          name: name,
        );

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      abbreviation: json['sigla'],
      name: json['nome'],
    );
  }

  factory StateModel.fromEntity(StateEntity entity) {
    return StateModel(
      id: entity.id,
      abbreviation: entity.abbreviation,
      name: entity.name,
    );
  }
}
