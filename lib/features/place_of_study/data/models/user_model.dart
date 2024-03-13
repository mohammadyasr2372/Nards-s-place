// @Entity(tableName: 'User',primaryKeys: ['id'])


import 'package:dashbord_cafe/features/place_of_study/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? phone,
    String? password,
    int? role,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            address: address,
            phone: phone,
            password: password,
            role: role);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
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
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        address: entity.address,
        phone: entity.phone,
        password: entity.password,
        role: entity.role);
  }

}
