// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/room_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/room_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/room_repository.dart';
import 'package:dio/dio.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomApiService _roomApiService;
  RoomRepositoryImpl(
    this._roomApiService,
  );

  @override
  Future<DataState<List<RoomModel>>> getRooms({required int idPlace}) async {
    try {
      final httpResponse = await _roomApiService.getRooms(idPlace:idPlace );

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
  Future<DataState<List<RoomModel>>> getRoomsByCategry({required int idPlace,required int idCategry}) async {
    try {
      final httpResponse = await _roomApiService.getRoomsByCategry(idPlace:idPlace, idCategry: idCategry );

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
  Future<DataState<RoomEntity>> postRoom(
      {required int idPlace,required RoomEntity newRoomEntity}) async {
    try {
      final httpResponse =
          await _roomApiService.postRoom(newRoomModel: newRoomEntity, idPlace: idPlace,);

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
  Future<DataState<RoomEntity>> putRoom(
      {required int idPlace,required int id, required RoomEntity newRoomEntity}) async{
    try {
      final httpResponse =
          await _roomApiService.putRoom(idPlace: idPlace,newRoomModel: newRoomEntity, id: id);

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
  Future<DataState<String>> deletRoom({required int idPlace,required int id}) async {
    try {
      final httpResponse = await _roomApiService.deletRoom(idPlace: idPlace,id: id);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data );
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
}
