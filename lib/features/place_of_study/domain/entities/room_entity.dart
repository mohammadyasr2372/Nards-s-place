// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final int? id;
  final int? max_num_of_chairs;
  final int? status;
  final int? placeId;
  final int? category_id;
  const RoomEntity({
    this.id,
    this.max_num_of_chairs,
    this.status,
    this.placeId,
    this.category_id,
  });

  @override
  List<Object?> get props {
    return [
      id,
      max_num_of_chairs,
      status,
      placeId,
      category_id,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'max_num_of_chairs': max_num_of_chairs,
      'status': status,
      'placeId': placeId,
      'category_id': category_id,
    };
  }

  factory RoomEntity.fromJson(Map<String, dynamic> map) {
    return RoomEntity(
      id: map['id'] != null ? map['id'] as int : null,
      max_num_of_chairs: map['max_num_of_chairs'] != null ? map['max_num_of_chairs'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      placeId: map['placeId'] != null ? map['placeId'] as int : null,
      category_id: map['category_id'] != null ? map['category_id'] as int : null,
    );
  }

}
