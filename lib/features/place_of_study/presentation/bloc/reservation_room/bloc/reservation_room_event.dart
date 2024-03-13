import '../../../../domain/entities/reservation_entity.dart';

abstract class ReservationRoomEvent {
  const ReservationRoomEvent();
}

class GetReservationsRooms extends ReservationRoomEvent {
  final int idPlace;
  GetReservationsRooms({required this.idPlace});
}

class PostReservationRooms extends ReservationRoomEvent {
  final int idPlace;
  final ReservationEntity reservationRoomsEntity;
  PostReservationRooms({
    required this.idPlace,
    required this.reservationRoomsEntity,
  });
}

class PutReservation extends ReservationRoomEvent {
  ReservationEntity reservationEntity;
  int id;
  PutReservation({required this.reservationEntity, required this.id});
}

class DeletReservation extends ReservationRoomEvent {
  int id;

  DeletReservation({required this.id});
}
