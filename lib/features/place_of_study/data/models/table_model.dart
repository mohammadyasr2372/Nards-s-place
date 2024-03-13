// ignore_for_file: non_constant_identifier_names

import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';

// @Entity(tableName: 'Table',primaryKeys: ['id'])
class TableModel extends TableEntity {
  const TableModel({
    int? id,
    int? status,
    int? category_id,
    int? room_id,
    int? available_seats,
    String? message,
  }) : super(
            id: id,
            status: status,
            category_id: category_id,
            room_id: room_id,
            available_seats: available_seats,
            message: message);

  factory TableModel.fromJson(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      category_id:
          map['category_id'] != null ? map['category_id'] as int : null,
      room_id: map['room_id'] != null ? map['room_id'] as int : null,
      available_seats: map['available_seats'] != null
          ?  map['available_seats'] as int
          : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  factory TableModel.fromEntity(TableEntity entity) {
    return TableModel(
        id: entity.id,
        status: entity.status,
        category_id: entity.category_id,
        room_id: entity.room_id,
        available_seats: entity.available_seats,
        message: entity.message);
  }
}
