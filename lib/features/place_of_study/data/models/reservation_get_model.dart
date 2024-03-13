// ignore_for_file: non_constant_identifier_names

import '../../domain/entities/reservation_get_entity.dart';
import 'place_model.dart';
import 'room_model.dart';
import 'table_model.dart';

// @Entity(tableName: 'Reservation',primaryKeys: ['id'])
class ReservationGetModel extends ReservationGetEntity {
  const ReservationGetModel({
    int? id,
    PlaceModel? place,
    RoomModel? room,
    TableModel? table,
    int? status,
    int? number_of_seats,
    List<dynamic>? time,
    int? period_of_reservations,
  }) : super(
          id: id,
          place: place,
          room: room,
          table: table,
          status: status,
          number_of_seats: number_of_seats,
          time: time,
          period_of_reservations: period_of_reservations,
        );

  factory ReservationGetModel.fromJson(Map<String, dynamic> map) {
    return ReservationGetModel(
      id: map['id'] != null ? map['id'] as int : null,
      place: map['place'] != null
          ? PlaceModel.fromJson(map['place'] as Map<String, dynamic>)
          : null,
      room: map['room'] != null
          ? RoomModel.fromJson(map['room'] as Map<String, dynamic>)
          : null,
      table: map['table'] != null
          ? TableModel.fromJson(map['table'] as Map<String, dynamic>)
          : null,
      status: map['status'] != null ? map['status'] as int : null,
      number_of_seats:
          map['number_of_seats'] != null ? map['number_of_seats'] as dynamic : null,
      time: map['time'] != null
          ? List<int>.from((map['time'] as List<dynamic>))
          : null,
      period_of_reservations: map['period_of_reservations'] != null
          ? map['period_of_reservations'] as int
          : null,
    );
  }
}
