import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/user_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/user_repository.dart';

class GetUserUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return _userRepository.getUsers();
  }
}

class PostUserUseCase implements UseCase<DataState<UserEntity>, UserEntity> {
  final UserRepository _userRepository;

  PostUserUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({UserEntity? params}) {
    return _userRepository.postUser(newUserEntity: params!);
  }
}

class PutUserUseCase implements UseCase<DataState<UserEntity>, UserEntity> {
  final UserRepository _userRepository;

  PutUserUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({UserEntity? params, int? id}) {
    return _userRepository.putUser(newUserEntity: params!, id: id!);
  }
}

class DeletUserUseCase implements UseCase<DataState<String>, int> {
  final UserRepository _userRepository;

  DeletUserUseCase(this._userRepository);

  @override
  Future<DataState<String>> call({int? params}) {
    return _userRepository.deletUser(id: params!);
  }
}
