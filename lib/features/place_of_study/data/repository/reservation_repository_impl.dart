// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/reservation_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/reservation_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/reservation_repository.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/reservation_get_entity.dart';
import '../models/reservation_get_model.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationApiService _reservationApiService;
  ReservationRepositoryImpl(
    this._reservationApiService,
  );

  @override
  Future<DataState<List<ReservationGetModel>>> getReservationsRooms(
      {required int idPlace}) async {
    try {
      final httpResponse =
          await _reservationApiService.getReservationsRoom(idPlace: idPlace);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ReservationGetModel>>> getReservationsTable(
      {required int idPlace}) async {
    try {
      final httpResponse =
          await _reservationApiService.getReservationsTable(idPlace: idPlace);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ReservationGetEntity>> postReservationRoom(
      {required int idPlace,
      required ReservationEntity newReservationRoomEntity}) async {
    try {
      final httpResponse = await _reservationApiService.postReservationRoom(
          idPlace: idPlace, newReservationRoom: newReservationRoomEntity);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ReservationGetEntity>> postReservationTable(
      {required int idPlace,
      required ReservationEntity newReservationTableEntity}) async {
    try {
      final httpResponse = await _reservationApiService.postReservationTable(
          idPlace: idPlace, newReservationTable: newReservationTableEntity);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> deletReservation({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<ReservationGetEntity>> putReservation(
      {required int id, required ReservationEntity newReservationEntity}) {
    throw UnimplementedError();
  }
}
