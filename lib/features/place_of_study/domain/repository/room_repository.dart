import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';

abstract class RoomRepository {
  // API methods
  Future<DataState<List<RoomEntity>>> getRooms({required int idPlace});

   Future<DataState<List<RoomEntity>>> getRoomsByCategry({required int idPlace,required int idCategry});

  Future<DataState<RoomEntity>> postRoom({required int idPlace,required RoomEntity newRoomEntity});

  Future<DataState<RoomEntity>> putRoom(
      {required int idPlace,required int id, required RoomEntity newRoomEntity});

  Future<DataState<String>> deletRoom({required int idPlace,required int id});
}
