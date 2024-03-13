import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName:'Place' ,primaryKeys:['id'])
class PlaceModel extends PlaceEntity {
  const PlaceModel({
    int? id,
    String? name,
    String? location,
  }) : super(id, name, location);

  factory PlaceModel.fromJson(Map<String, dynamic> map) {
    return PlaceModel(
     id: map['id'] != null ? map['id'] as int : null,

      name: map['name'] ?? "",
      location: map['location'] ?? "",
    );
  }
  factory PlaceModel.fromEntity(PlaceEntity entity) {
    return PlaceModel(
        id: entity.id, name: entity.name, location: entity.location);
  }
}
