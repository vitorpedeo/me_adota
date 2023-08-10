import 'package:me_adota/features/home/domain/entities/city.dart';

class CityModel extends CityEntity {
  const CityModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['nome'],
    );
  }

  factory CityModel.fromEntity(CityEntity entity) {
    return CityModel(
      id: entity.id,
      name: entity.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': name,
    };
  }
}
