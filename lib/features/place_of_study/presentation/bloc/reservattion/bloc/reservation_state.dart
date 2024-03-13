
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/reservation_get_entity.dart';

abstract class ReservationState extends Equatable {
  final List<ReservationGetEntity>? reservations;
  final ReservationGetEntity? reservation;
  final String? massege;

  final DioException? exception;
  const ReservationState({
    this.reservations,
    this.reservation,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [reservations, reservation,massege ,exception];
}

class ReservationsLoadingState extends ReservationState {
  const ReservationsLoadingState();
}

class ReservationsDoneState extends ReservationState {
  const ReservationsDoneState(List<ReservationGetEntity> reservations) : super(reservations: reservations);
}

class ReservationsErrorState extends ReservationState {
  const ReservationsErrorState(DioException exception) : super(exception: exception);
}

class PostReservationsDoneState extends ReservationState {
  const PostReservationsDoneState(ReservationGetEntity reservation) : super(reservation: reservation);
}
