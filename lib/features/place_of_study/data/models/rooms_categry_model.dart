// ignore_for_file: non_constant_identifier_names
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';

// @Entity(tableName: 'RoomsCategry',primaryKeys: ['id'])
class RoomsCategryModel extends RoomsCategryEntity {
  const RoomsCategryModel({
    int? id,
    String? type,
    int? place_id,
  }) : super(id: id, type: type, place_id: place_id);

  factory RoomsCategryModel.fromJson(Map<String, dynamic> map) {
    return RoomsCategryModel(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      place_id: map['place_id'] != null ? map['place_id'] as int : null,
    );
  }

  factory RoomsCategryModel.fromEntity(RoomsCategryEntity entity) {
    return RoomsCategryModel(
        id: entity.id, type: entity.type, place_id: entity.place_id);
  }
}
