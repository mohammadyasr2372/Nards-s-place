import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/rooms_categry_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rooms_categry_api_service.g.dart';

@RestApi(baseUrl: roomsCategryAPIBaseURL)
abstract class RoomsCategryApiService {
  factory RoomsCategryApiService(Dio dio) = _RoomsCategryApiService;

  @GET('/1/allRoomCategories')
  Future<HttpResponse<List<RoomsCategryModel>>> getRoomsCategrys({required int idPlace,});
  @POST('/1/newRoomCategory')
  Future<HttpResponse<RoomsCategryModel>> postRoomsCategry(
      {required int idPlace,@Body() required RoomsCategryEntity newRoomsCategryModel});

  @PUT('/1/update/1')
  Future<HttpResponse<RoomsCategryModel>> putRoomsCategry(
      {required int idPlace,@Query('') required int id,@Body() required RoomsCategryEntity newRoomsCategryModel});
  @DELETE('/1/delete/6')
  Future<HttpResponse<String>> deletRoomsCategry({required int idPlace,@Query('') required int id});
}
