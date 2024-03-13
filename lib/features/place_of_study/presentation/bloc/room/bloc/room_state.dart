
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RoomState extends Equatable {
  final List<RoomEntity>? rooms;
  final RoomEntity? room;
  final String? massege;

  final DioException? exception;
  const RoomState({
    this.rooms,
    this.room,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [rooms, room,massege ,exception];
}

class RoomsLoadingState extends RoomState {
  const RoomsLoadingState();
}

class RoomsDoneState extends RoomState {
  const RoomsDoneState(List<RoomEntity> rooms) : super(rooms: rooms);
}

class RoomsErrorState extends RoomState {
  const RoomsErrorState(DioException exception) : super(exception: exception);
}
class PostRoomsDoneState extends RoomState {
  const PostRoomsDoneState(RoomEntity room) : super(room: room);
}

class PutRoomsDoneState extends RoomState {
  const PutRoomsDoneState(RoomEntity room) : super(room: room);
}
class DeletRoomsDoneState extends RoomState {
  const DeletRoomsDoneState(String massege) : super(massege: massege);
}
