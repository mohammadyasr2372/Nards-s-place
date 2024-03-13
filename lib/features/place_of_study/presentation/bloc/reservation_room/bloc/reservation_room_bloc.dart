import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/reservation.dart';
import 'reservation_room_event.dart';
import 'reservation_room_state.dart';

class ReservationRoomBloc extends Bloc<ReservationRoomEvent, ReservationRoomState> {
  final GetReservationRoomUseCase _getReservationRoomUseCase;
  final PostReservationRoomUseCase _postReservationRoomUseCase;

  ReservationRoomBloc(
      this._getReservationRoomUseCase,
      this._postReservationRoomUseCase)
      : super(const ReservationsRoomLoadingState()) {
    on<GetReservationsRooms>(onGetReservationsRooms);

    on<PostReservationRooms>(onPostReservationsRooms);
  }

  void onGetReservationsRooms(
      GetReservationsRooms event, Emitter<ReservationRoomState> emit) async {
    final dataState = await _getReservationRoomUseCase(params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(GetReservationsRoomDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsRoomErrorState(dataState.exception!));
    }
  }


  void onPostReservationsRooms(
      PostReservationRooms event, Emitter<ReservationRoomState> emit) async {
    final dataState =
        await _postReservationRoomUseCase(idPlace: event.idPlace,params: event.reservationRoomsEntity);

    if (dataState is DataSuccess) {
      emit(PostReservationsRoomDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsRoomErrorState(dataState.exception!));
    }
  }

 
}
