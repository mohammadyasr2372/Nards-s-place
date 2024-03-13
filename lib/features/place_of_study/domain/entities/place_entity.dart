// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  final int? id;
  final String? name;
  final String? location;

  const PlaceEntity(this.id, this.name, this.location);

  @override
  List<Object?> get props => [id, name, location];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
    };
  }

  factory PlaceEntity.fromJson(Map<String, dynamic> map) {
    return PlaceEntity(
      map['id'] != null ? map['id'] as int : null,
      map['name'] != null ? map['name'] as String : null,
      map['location'] != null ? map['location'] as String : null
      
    );
  }
}
