// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/rooms_categry_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/rooms_categry_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/rooms_categry_repository.dart';
import 'package:dio/dio.dart';

class RoomsCategryRepositoryImpl implements RoomsCategryRepository {
  final RoomsCategryApiService _roomsCategryApiService;
  RoomsCategryRepositoryImpl(
    this._roomsCategryApiService,
  );

  @override
  Future<DataState<List<RoomsCategryModel>>> getRoomsCategrys({required int idPlace}) async {
    try {
      final httpResponse = await _roomsCategryApiService.getRoomsCategrys(idPlace: idPlace,);

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
  Future<DataState<RoomsCategryModel>> postRoomsCategry(
      {required int idPlace,required RoomsCategryEntity newRoomsCategryEntity}) async {
    try {
      final httpResponse =
          await _roomsCategryApiService.postRoomsCategry(idPlace: idPlace,newRoomsCategryModel: newRoomsCategryEntity);

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
  Future<DataState<RoomsCategryEntity>> putRoomsCategry(
      {required int idPlace,required int id, required RoomsCategryEntity newRoomsCategryEntity}) async{
    try {
      final httpResponse =
          await _roomsCategryApiService.putRoomsCategry(idPlace: idPlace,newRoomsCategryModel: newRoomsCategryEntity, id: id);

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
  Future<DataState<String>> deletRoomsCategry({required int idPlace,required int id}) async {
    try {
      final httpResponse = await _roomsCategryApiService.deletRoomsCategry(idPlace: idPlace,id: id);

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
