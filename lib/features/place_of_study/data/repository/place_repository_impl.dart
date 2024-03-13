// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/place_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/place_repository.dart';
import 'package:dio/dio.dart';
import '../data_sources/local/app_database.dart';
import '../models/place_model.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceApiService _placeApiService;
    final AppDatabase _appDatabase;
  PlaceRepositoryImpl(
    this._placeApiService, this._appDatabase,
  );

  @override
  Future<DataState<List<PlaceModel>>> getPlaces() async {
    try {
      final httpResponse = await _placeApiService.getPlaces();

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
  Future<DataState<PlaceModel>> getPlaceInfo({required int idPlace}) async {
    try {
      final httpResponse = await _placeApiService.getPlaceInfo(idPlace: idPlace);

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
  Future<DataState<PlaceEntity>> postPlace(
      {required PlaceEntity newPlaceEntity}) async {
    try {
      final httpResponse =
          await _placeApiService.postPlace(newPlaceModel: newPlaceEntity);

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
  Future<DataState<PlaceEntity>> putPlace(
      {required int id, required PlaceEntity newPlaceEntity}) async{
    try {
      final httpResponse =
          await _placeApiService.putPlace(newPlaceModel: newPlaceEntity, id: id);

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
  Future<DataState<String>> deletPlace({required int id}) async {
    try {
      final httpResponse = await _placeApiService.deletPlace(id: id);

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

  @override
  Future<List<PlaceModel>> getSavedPlaces() async {
    return _appDatabase.placeDao.getPlaces();
  }

  @override
  Future<void> removePlace(PlaceEntity place) {
    return _appDatabase.placeDao.deletPlace( PlaceModel.fromEntity(place));
  }

  @override
  Future<void> savePlace(PlaceEntity place) {
    return _appDatabase.placeDao.insertPlace(PlaceModel.fromEntity(place));
  }
  
}
