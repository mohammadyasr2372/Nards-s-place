import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/user_entity.dart';

abstract class UserRepository {
  // API methods
  Future<DataState<List<UserEntity>>> getUsers();

  Future<DataState<UserEntity>> postUser({required UserEntity newUserEntity});

  Future<DataState<UserEntity>> putUser(
      {required int id, required UserEntity newUserEntity});

  Future<DataState<String>> deletUser({required int id});
}
