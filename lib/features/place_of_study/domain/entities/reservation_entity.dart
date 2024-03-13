// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names



import 'package:equatable/equatable.dart';

class ReservationEntity extends Equatable {
  final int? type;
  final String? time;
  final int? num_of_seats;
  final int? room_id;
  final int? table_id;
  final int? period_of_reservations;
  const ReservationEntity({
    this.type,
    this.time,
    this.num_of_seats,
    this.room_id,
    this.table_id,
    this.period_of_reservations,
  });

  @override
  List<Object?> get props {
    return [
      type,
      time,
      num_of_seats,
      room_id,
      table_id,
      period_of_reservations,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'time': time,
      'num_of_seats': num_of_seats,
      'room_id': room_id,
      'table_id': table_id,
      'period_of_reservations': period_of_reservations,
    };
  }

  factory ReservationEntity.fromJson(Map<String, dynamic> map) {
    return ReservationEntity(
      type: map['type'] != null ? map['type'] as int : null,
      time: map['time'] != null ? map['time'] as String : null,
      num_of_seats: map['num_of_seats'] != null ? map['num_of_seats'] as int : null,
      room_id: map['room_id'] != null ? map['room_id'] as int : null,
      table_id: map['table_id'] != null ? map['table_id'] as int : null,
      period_of_reservations: map['period_of_reservations'] != null ? map['period_of_reservations'] as int : null,
    );
  }

}
