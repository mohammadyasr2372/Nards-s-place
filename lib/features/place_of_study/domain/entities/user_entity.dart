// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? phone;
  final String? password;
  final int? role;
  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.password,
    this.role,
  });

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      address,
      phone,
      password,
      role,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'phone': phone,
      'password': password,
      'role': role,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      role: map['role'] != null ? map['role'] as int : null,
    );
  }
}
