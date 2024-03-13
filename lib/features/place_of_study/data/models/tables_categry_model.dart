// ignore_for_file: non_constant_identifier_names

import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';

// @Entity(tableName: 'TablesCategry',primaryKeys: ['id'])
class TablesCategryModel extends TablesCategryEntity {
  const TablesCategryModel({
    int? id,
    int? num_of_seats,
    String? shape,
  }) : super(id: id, num_of_seats: num_of_seats, shape: shape);

  factory TablesCategryModel.fromJson(Map<String, dynamic> map) {
    return TablesCategryModel(
      id: map['id'] != null ? map['id'] as int : null,
      num_of_seats:
          map['num_of_seats'] != null ? map['num_of_seats'] as int : null,
      shape: map['shape'] != null ? map['shape'] as String : null,
    );
  }

  factory TablesCategryModel.fromEntity(TablesCategryEntity entity) {
    return TablesCategryModel(
        id: entity.id, num_of_seats: entity.num_of_seats, shape: entity.shape);
  }
}
