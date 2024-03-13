import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/tables_categry_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tables_categry_api_service.g.dart';

@RestApi(baseUrl: tablesCategryAPIBaseURL)
abstract class TablesCategryApiService {
  factory TablesCategryApiService(Dio dio) = _TablesCategryApiService;

  @GET('/1/AllTables')
  Future<HttpResponse<List<TablesCategryModel>>> getTablesCategrys({required int idPlace,});
  @POST('/1/newTable')
  Future<HttpResponse<TablesCategryModel>> postTablesCategry(
      {required int idPlace,@Body() required TablesCategryEntity newTablesCategryModel});

  @PUT('/1/update/1')
  Future<HttpResponse<TablesCategryModel>> putTablesCategry(
      {required int idPlace,required int id,@Body() required TablesCategryEntity newTablesCategryModel});
  @DELETE('path')
  Future<HttpResponse<String>> deletTablesCategry({required int idPlace,@Body() required int id});
}
