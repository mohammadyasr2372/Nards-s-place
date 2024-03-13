// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names


import 'package:equatable/equatable.dart';

import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';

class ReservationGetEntity extends Equatable {
  final int? id;
  final PlaceEntity? place;
  final RoomEntity? room;
  final TableEntity? table;
  final int? status;
  final int? number_of_seats;
  final List<dynamic>? time;
  final int? period_of_reservations;
  const ReservationGetEntity({
    this.id,
    this.place,
    this.room,
    this.table,
    this.status,
    this.number_of_seats,
    this.time,
    this.period_of_reservations,
  });

  @override
  List<Object?> get props {
    return [
      id,
    place,
    room,
    table,
    status,
    number_of_seats,
    time,
    period_of_reservations,
    ];
  }

  

  factory ReservationGetEntity.fromJson(Map<String, dynamic> map) {
    return ReservationGetEntity(
      id: map['id'] != null ? map['id'] as int : null,
      place: map['place'] != null ? PlaceEntity.fromJson(map['place'] as Map<String,dynamic>) : null,
      room: map['room'] != null ? RoomEntity.fromJson(map['room'] as Map<String,dynamic>) : null,
      table: map['table'] != null ? TableEntity.fromJson(map['table'] as Map<String,dynamic>) : null,
      status: map['status'] != null ? map['status'] as int : null,
      number_of_seats: map['number_of_seats'] != null ? map['number_of_seats'] as int : null,
      time: map['time'] != null ? List<int>.from((map['time'] as List<dynamic>)): null,
      period_of_reservations: map['period_of_reservations'] != null ? map['period_of_reservations'] as int : null,
    );
  }
}
