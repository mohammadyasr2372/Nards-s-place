import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/reservation_entity.dart';

import '../entities/reservation_get_entity.dart';

abstract class ReservationRepository {
  // API methods
  Future<DataState<List<ReservationGetEntity>>> getReservationsRooms(
      {required int idPlace});

  Future<DataState<List<ReservationGetEntity>>> getReservationsTable(
      {required int idPlace});

  Future<DataState<ReservationGetEntity>> postReservationRoom(
      {required int idPlace,required ReservationEntity newReservationRoomEntity});

  Future<DataState<ReservationGetEntity>> postReservationTable(
      {required int idPlace,required ReservationEntity newReservationTableEntity});

  Future<DataState<ReservationGetEntity>> putReservation(
      {required int id, required ReservationEntity newReservationEntity});

  Future<DataState<String>> deletReservation({required int id});
}
