// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names



import 'package:equatable/equatable.dart';

class RoomsCategryEntity extends Equatable {
  final int? id;
  final String? type;
  final int? place_id;
  const RoomsCategryEntity({
    this.id,
    this.type,
    this.place_id,
  });

  @override
  List<Object?> get props => [id, type, place_id];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'place_id': place_id,
    };
  }

  factory RoomsCategryEntity.fromJson(Map<String, dynamic> map) {
    return RoomsCategryEntity(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      place_id: map['place_id'] != null ? map['place_id'] as int : null,
    );
  }

}
