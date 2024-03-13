// ignore_for_file: non_constant_identifier_names

import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';

// @Entity(tableName: 'Room',primaryKeys: ['id'])
class RoomModel extends RoomEntity {
  const RoomModel({
    int? id,
    int? max_num_of_chairs,
    int? status,
    int? placeId,
    int? category_id,
  }) : super(
            id: id,
            max_num_of_chairs: max_num_of_chairs,
            status: status,
            placeId: placeId,
            category_id: category_id);

  factory RoomModel.fromJson(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] != null ? map['id'] as int : null,
      max_num_of_chairs: map['max_num_of_chairs'] != null
          ? map['max_num_of_chairs'] as int
          : null,
      status: map['status'] != null ? map['status'] as int : null,
      placeId: map['placeId'] != null ? map['placeId'] as int : null,
      category_id:
          map['category_id'] != null ? map['category_id'] as int : null,
    );
  }

  factory RoomModel.fromEntity(RoomEntity entity) {
    return RoomModel(
        id: entity.id,
        max_num_of_chairs: entity.max_num_of_chairs,
        status: entity.status,
        placeId: entity.placeId,
        category_id: entity.category_id);
  }
}
