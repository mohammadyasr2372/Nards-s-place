
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/reservation_get_entity.dart';

abstract class ReservationRoomState extends Equatable {
  final List<ReservationGetEntity>? reservationsRoom;
  final ReservationGetEntity? reservation;
  final String? massege;

  final DioException? exception;
  const ReservationRoomState({
    this.reservationsRoom,
    this.reservation,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [reservationsRoom, reservation,massege ,exception];
}

class ReservationsRoomLoadingState extends ReservationRoomState {
  const ReservationsRoomLoadingState();
}

class GetReservationsRoomDoneState extends ReservationRoomState {
  const GetReservationsRoomDoneState(List<ReservationGetEntity> reservationsRoom) : super(reservationsRoom: reservationsRoom);
}

class ReservationsRoomErrorState extends ReservationRoomState {
  const ReservationsRoomErrorState(DioException exception) : super(exception: exception);
}

class PostReservationsRoomDoneState extends ReservationRoomState {
  const PostReservationsRoomDoneState(ReservationGetEntity reservation) : super(reservation: reservation);
}
