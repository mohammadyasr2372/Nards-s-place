// ignore_for_file: non_constant_identifier_names

import 'package:dashbord_cafe/features/place_of_study/domain/entities/reservation_entity.dart';

// @Entity(tableName: 'Reservation',primaryKeys: ['id'])
class ReservationModel extends ReservationEntity {
  const ReservationModel({
    int? type,
    String? time,
    int? num_of_seats,
    int? room_id,
    int? table_id,
    int? period_of_reservations,
  }) : super(
            type: type,
            time: time,
            num_of_seats: num_of_seats,
            room_id: room_id,
            table_id: table_id);

  factory ReservationModel.fromJson(Map<String, dynamic> map) {
    return ReservationModel(
      type: map['type'] != null ? map['type'] as int : null,
      time: map['time'] != null ? map['time'] as String : null,
      num_of_seats:
          map['num_of_seats'] != null ? map['num_of_seats'] as int : null,
      room_id: map['room_id'] != null ? map['room_id'] as int : null,
      table_id: map['table_id'] != null ? map['table_id'] as int : null,
      period_of_reservations: map['period_of_reservations'] != null
          ? map['period_of_reservations'] as int
          : null,
    );
  }

  factory ReservationModel.fromEntity(ReservationEntity entity) {
    return ReservationModel(
        type: entity.type,
        time: entity.time,
        num_of_seats: entity.num_of_seats,
        room_id: entity.room_id,
        table_id: entity.table_id);
  }
}
