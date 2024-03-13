import '../../../../domain/entities/reservation_entity.dart';

abstract class ReservationEvent {
  const ReservationEvent();
}

class GetReservationsRooms extends ReservationEvent {
  final int idPlace;
  GetReservationsRooms({required this.idPlace});
}

class GetReservationsTables extends ReservationEvent {
  final int idPlace;
  GetReservationsTables({required this.idPlace});
}

class PostReservationRooms extends ReservationEvent {
  final int idPlace;
  final ReservationEntity reservationRoomsEntity;
  PostReservationRooms({
    required this.idPlace,
    required this.reservationRoomsEntity,
  });
}

class PostReservationTables extends ReservationEvent {
  final int idPlace;
  final ReservationEntity reservationTablesEntity;
  PostReservationTables({
    required this.idPlace,
    required this.reservationTablesEntity,
  });
}

class PutReservation extends ReservationEvent {
  ReservationEntity reservationEntity;
  int id;
  PutReservation({required this.reservationEntity, required this.id});
}

class DeletReservation extends ReservationEvent {
  int id;

  DeletReservation({required this.id});
}
