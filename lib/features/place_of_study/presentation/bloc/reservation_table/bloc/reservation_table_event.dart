import '../../../../domain/entities/reservation_entity.dart';

abstract class ReservationTableEvent {
  const ReservationTableEvent();
}


class GetReservationsTables extends ReservationTableEvent {
  final int idPlace;
  GetReservationsTables({required this.idPlace});
}

class PostReservationTables extends ReservationTableEvent {
  final int idPlace;
  final ReservationEntity reservationTablesEntity;
  PostReservationTables({
    required this.idPlace,
    required this.reservationTablesEntity,
  });
}

class PutReservation extends ReservationTableEvent {
  ReservationEntity reservationEntity;
  int id;
  PutReservation({required this.reservationEntity, required this.id});
}

class DeletReservation extends ReservationTableEvent {
  int id;

  DeletReservation({required this.id});
}
