import 'package:dashbord_cafe/features/place_of_study/domain/entities/reservation_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dashbord_cafe/core/constants/constants.dart';

import '../../models/reservation_get_model.dart';

part 'reservation_api_service.g.dart';

@RestApi(baseUrl: reservationAPIBaseURL)
abstract class ReservationApiService {
  factory ReservationApiService(Dio dio) = _ReservationApiService;

  @GET('/table-reservations/1/get-all')
  Future<HttpResponse<List<ReservationGetModel>>> getReservationsTable({required int idPlace});

  @GET('/room-reservations/1/get-all')
  Future<HttpResponse<List<ReservationGetModel>>> getReservationsRoom({required int idPlace});

  @POST('/table-reservations/1/reserve-table')
  Future<HttpResponse<ReservationGetModel>> postReservationTable(
      {required int idPlace,@Body() required ReservationEntity newReservationTable});

   @POST('/room-reservations/1/reserve-room')
  Future<HttpResponse<ReservationGetModel>> postReservationRoom(
      {required int idPlace,@Body() required ReservationEntity newReservationRoom});
}
