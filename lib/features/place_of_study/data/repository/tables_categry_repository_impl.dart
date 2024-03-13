// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/tables_categry_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/tables_categry_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/tables_categry_repository.dart';
import 'package:dio/dio.dart';

class TablesCategryRepositoryImpl implements TablesCategryRepository {
  final TablesCategryApiService _tablesCategryApiService;
  TablesCategryRepositoryImpl(
    this._tablesCategryApiService,
  );

  @override
  Future<DataState<List<TablesCategryModel>>> getTablesCategrys({required int idPlace,}) async {
    try {
      final httpResponse = await _tablesCategryApiService.getTablesCategrys(idPlace: idPlace,);

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
  Future<DataState<TablesCategryModel>> postTablesCategry(
      {required int idPlace,required TablesCategryEntity newTablesCategryEntity}) async {
    try {
      final httpResponse =
          await _tablesCategryApiService.postTablesCategry(idPlace: idPlace,newTablesCategryModel: newTablesCategryEntity);

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
  Future<DataState<TablesCategryModel>> putTablesCategry(
      {required int idPlace,required int id, required TablesCategryEntity newTablesCategryEntity}) async{
    try {
      final httpResponse =
          await _tablesCategryApiService.putTablesCategry(idPlace: idPlace,newTablesCategryModel: newTablesCategryEntity, id: id);

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
  Future<DataState<String>> deletTablesCategry({required int idPlace,required int id}) async {
    try {
      final httpResponse = await _tablesCategryApiService.deletTablesCategry(idPlace: idPlace,id: id);

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
