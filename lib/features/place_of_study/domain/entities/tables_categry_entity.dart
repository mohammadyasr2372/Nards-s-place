// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names


import 'package:equatable/equatable.dart';

class TablesCategryEntity extends Equatable {
  final int? id;
  final int? num_of_seats;
  final String? shape;
  const TablesCategryEntity({
    this.id,
    this.num_of_seats,
    this.shape,
  });

  @override
  List<Object?> get props => [id, num_of_seats, shape];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'num_of_seats': num_of_seats,
      'shape': shape,
    };
  }

  factory TablesCategryEntity.fromJson(Map<String, dynamic> map) {
    return TablesCategryEntity(
      id: map['id'] != null ? map['id'] as int : null,
      num_of_seats: map['num_of_seats'] != null ? map['num_of_seats'] as int : null,
      shape: map['shape'] != null ? map['shape'] as String : null,
    );
  }

}
