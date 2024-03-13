import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/table_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'table_api_service.g.dart';

@RestApi(baseUrl: tableAPIBaseURL)
abstract class TableApiService {
  factory TableApiService(Dio dio) = _TableApiService;

  @GET('/1/AllTables')
  Future<HttpResponse<List<TableModel>>> getTables({required int idPlace});
  @POST('/1/newTable')
  Future<HttpResponse<TableModel>> postTable(
      {required int idPlace,@Body() required TableEntity newTableModel});

  @PUT('/1/update/1')
  Future<HttpResponse<TableModel>> putTable(
      {required int idPlace,required int id,@Body() required TableEntity newTableModel});
  @DELETE('/delete/4')
  Future<HttpResponse<String>> deletTable({required int idPlace,required int id});
}
