import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/rooms_categry_repository.dart';

class GetRoomsCategryUseCase
    implements UseCase<DataState<List<RoomsCategryEntity>>, int> {
  final RoomsCategryRepository _roomsCategryRepository;

  GetRoomsCategryUseCase(this._roomsCategryRepository);

  @override
  Future<DataState<List<RoomsCategryEntity>>> call({int? params}) {
    return _roomsCategryRepository.getRoomsCategrys(idPlace: params!);
  }
}

class PostRoomsCategryUseCase
    implements UseCase<DataState<RoomsCategryEntity>, RoomsCategryEntity> {
  final RoomsCategryRepository _roomsCategryRepository;

  PostRoomsCategryUseCase(this._roomsCategryRepository);

  @override
  Future<DataState<RoomsCategryEntity>> call({RoomsCategryEntity? params, int? idPlace}) {
    return _roomsCategryRepository.postRoomsCategry(
        newRoomsCategryEntity: params!, idPlace: idPlace!);
  }
}

class PutRoomsCategryUseCase
    implements UseCase<DataState<RoomsCategryEntity>, RoomsCategryEntity> {
  final RoomsCategryRepository _roomsCategryRepository;

  PutRoomsCategryUseCase(this._roomsCategryRepository);

  @override
  Future<DataState<RoomsCategryEntity>> call(
      {RoomsCategryEntity? params, int? id, int? idPlace}) {
    return _roomsCategryRepository.putRoomsCategry(
        newRoomsCategryEntity: params!, id: id!, idPlace: idPlace!);
  }
}

class DeletRoomsCategryUseCase implements UseCase<DataState<String>, int> {
  final RoomsCategryRepository _roomsCategryRepository;

  DeletRoomsCategryUseCase(this._roomsCategryRepository);

  @override
  Future<DataState<String>> call({int? params, int? idPlace}) {
    return _roomsCategryRepository.deletRoomsCategry(id: params!, idPlace: idPlace!);
  }
}
