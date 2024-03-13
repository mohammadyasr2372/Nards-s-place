// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../domain/entities/room_entity.dart';

abstract class RoomEvent {
  const RoomEvent();
}

class GetRooms extends RoomEvent {
 int idPlace;
  GetRooms({
    required this.idPlace,
  });
}

class GetRoomsByCategry extends RoomEvent {
 int idPlace;
 int idCategry;
  GetRoomsByCategry({required this.idCategry,
    required this.idPlace,
  });
}


class PostRoom extends RoomEvent {
  int idPlace;
  RoomEntity roomEntity;
   PostRoom({required this.idPlace,
    required this.roomEntity,
  });
}


class PutRoom extends RoomEvent {
  int idPlace;
  RoomEntity roomEntity;
  int id;
   PutRoom({required this.idPlace,required this.roomEntity,required this.id});
}
class DeletRoom extends RoomEvent {
  int idPlace;
  int id;

   DeletRoom({required this.idPlace,required this.id});
}