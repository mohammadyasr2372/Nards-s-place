import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/reservation.dart';
import 'reservation_table_event.dart';
import 'reservation_table_state.dart';

class ReservationTableBloc extends Bloc<ReservationTableEvent, ReservationTableState> {
 
  final GetReservationTableUseCase _getReservationTableUseCase;
  final PostReservationTableUseCase _postReservationTableUseCase;

  ReservationTableBloc(
      this._getReservationTableUseCase,
      this._postReservationTableUseCase)
      : super(const ReservationsTableLoadingState()) {
    on<GetReservationsTables>(onGetReservationsTableTables);

   
    on<PostReservationTables>(onPostReservationsTableTables);
  }


  void onGetReservationsTableTables(
      GetReservationsTables event, Emitter<ReservationTableState> emit) async {
    final dataState = await _getReservationTableUseCase(params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(GetReservationsTableDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsTableErrorState(dataState.exception!));
    }
  }


  void onPostReservationsTableTables(
      PostReservationTables event, Emitter<ReservationTableState> emit) async {
    final dataState = await _postReservationTableUseCase(idPlace: event.idPlace,
        params: event.reservationTablesEntity);

    if (dataState is DataSuccess) {
      emit(PostReservationsTableDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ReservationsTableErrorState(dataState.exception!));
    }
  }
}
