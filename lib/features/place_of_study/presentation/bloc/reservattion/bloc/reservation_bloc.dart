import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/reservation.dart';
import 'reservation_event.dart';
import 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final GetReservationRoomUseCase _getReservationRoomUseCase;
  final GetReservationTableUseCase _getReservationTableUseCase;
  final PostReservationRoomUseCase _postReservationRoomUseCase;
  final PostReservationTableUseCase _postReservationTableUseCase;

  ReservationBloc(
      this._getReservationRoomUseCase,
      this._getReservationTableUseCase,
      this._postReservationRoomUseCase,
      this._postReservationTableUseCase)
      : super(const ReservationsLoadingState()) {
    on<GetReservationsRooms>(onGetReservationsRooms);
    on<GetReservationsTables>(onGetReservationsTables);

    on<PostReservationRooms>(onPostReservationsRooms);
    on<PostReservationTables>(onPostReservationsTables);
  }

  void onGetReservationsRooms(
      GetReservationsRooms event, Emitter<ReservationState> emit) async {
    final dataState = await _getReservationRoomUseCase(params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ReservationsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsErrorState(dataState.exception!));
    }
  }

  void onGetReservationsTables(
      GetReservationsTables event, Emitter<ReservationState> emit) async {
    final dataState = await _getReservationTableUseCase(params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ReservationsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsErrorState(dataState.exception!));
    }
  }

  void onPostReservationsRooms(
      PostReservationRooms event, Emitter<ReservationState> emit) async {
    final dataState =
        await _postReservationRoomUseCase(idPlace: event.idPlace,params: event.reservationRoomsEntity);

    if (dataState is DataSuccess) {
      emit(PostReservationsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsErrorState(dataState.exception!));
    }
  }

  void onPostReservationsTables(
      PostReservationTables event, Emitter<ReservationState> emit) async {
    final dataState = await _postReservationTableUseCase(idPlace: event.idPlace,
        params: event.reservationTablesEntity);

    if (dataState is DataSuccess) {
      emit(PostReservationsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsErrorState(dataState.exception!));
    }
  }
}
