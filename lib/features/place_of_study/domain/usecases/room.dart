import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/room_repository.dart';

class GetRoomUseCase implements UseCase<DataState<List<RoomEntity>>, int> {
  final RoomRepository _roomRepository;

  GetRoomUseCase(this._roomRepository);

  @override
  Future<DataState<List<RoomEntity>>> call({int? params}) {
    return _roomRepository.getRooms(idPlace: params!);
  }
}

class GetRoomByCategryUseCase implements UseCase<DataState<List<RoomEntity>>, int> {
  final RoomRepository _roomRepository;

  GetRoomByCategryUseCase(this._roomRepository);

  @override
  Future<DataState<List<RoomEntity>>> call({int? params,int? idCategry}) {
    return _roomRepository.getRoomsByCategry(idPlace: params!, idCategry: idCategry!);
  }
}

class PostRoomUseCase implements UseCase<DataState<RoomEntity>, RoomEntity> {
  final RoomRepository _roomRepository;

  PostRoomUseCase(this._roomRepository);

  @override
  Future<DataState<RoomEntity>> call({ RoomEntity? params,int? idPlace}) {
    return _roomRepository.postRoom(newRoomEntity: params!, idPlace: idPlace!);
  }
}

class PutRoomUseCase implements UseCase<DataState<RoomEntity>, RoomEntity> {
  final RoomRepository _roomRepository;

  PutRoomUseCase(this._roomRepository);

  @override
  Future<DataState<RoomEntity>> call({RoomEntity? params, int? id, int? idPlace}) {
    return _roomRepository.putRoom(newRoomEntity: params!, id: id!, idPlace: idPlace!);
  }
}

class DeletRoomUseCase implements UseCase<DataState<String>, int> {
  final RoomRepository _roomRepository;

  DeletRoomUseCase(this._roomRepository);

  @override
  Future<DataState<String>> call({int? params, int? idPlace}) {
    return _roomRepository.deletRoom(id: params!, idPlace: idPlace!);
  }
}
