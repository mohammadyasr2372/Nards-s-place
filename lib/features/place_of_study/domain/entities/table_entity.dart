// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names


import 'package:equatable/equatable.dart';

class TableEntity extends Equatable {
  final int? id;
  final int? status;
  final int? category_id;
  final int? room_id;
  final int? available_seats;
  final String? message;
  const TableEntity({
    this.id,
    this.status,
    this.category_id,
    this.room_id,
    this.available_seats,
    this.message,
  });

  @override
  List<Object?> get props {
    return [
      id,
      status,
      category_id,
      room_id,
      available_seats,
      message,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'category_id': category_id,
      'room_id': room_id,
      'available_seats': available_seats,
      'message': message,
    };
  }

  factory TableEntity.fromJson(Map<String, dynamic> map) {
    return TableEntity(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      category_id: map['category_id'] != null ? map['category_id'] as int : null,
      room_id: map['room_id'] != null ? map['room_id'] as int : null,
      available_seats: map['available_seats'] != null ? map['available_seats'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

}
