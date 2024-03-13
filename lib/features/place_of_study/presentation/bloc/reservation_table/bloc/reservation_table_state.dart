
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/reservation_get_entity.dart';

abstract class ReservationTableState extends Equatable {
  final List<ReservationGetEntity>? reservationsTable;
  final ReservationGetEntity? reservation;
  final String? massege;

  final DioException? exception;
  const ReservationTableState({
    this.reservationsTable,
    this.reservation,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [reservationsTable, reservation,massege ,exception];
}

class ReservationsTableLoadingState extends ReservationTableState {
  const ReservationsTableLoadingState();
}

class GetReservationsTableDoneState extends ReservationTableState {
  const GetReservationsTableDoneState(List<ReservationGetEntity> reservationsTable) : super(reservationsTable: reservationsTable);
}

class ReservationsTableErrorState extends ReservationTableState {
  const ReservationsTableErrorState(DioException exception) : super(exception: exception);
}

class PostReservationsTableDoneState extends ReservationTableState {
  const PostReservationsTableDoneState(ReservationGetEntity reservation) : super(reservation: reservation);
}
