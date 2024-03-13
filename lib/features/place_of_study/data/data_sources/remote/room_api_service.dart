import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/room_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'room_api_service.g.dart';

@RestApi(baseUrl: roomsAPIBaseURL)
abstract class RoomApiService {
  factory RoomApiService(Dio dio) = _RoomApiService;

  @GET('/3/AllRooms')
  Future<HttpResponse<List<RoomModel>>> getRooms({required int idPlace});

  @GET('/1/showByCategory/1')
  Future<HttpResponse<List<RoomModel>>> getRoomsByCategry({required int idPlace,required int idCategry});

  @POST('/2/newRoom')
  Future<HttpResponse<RoomModel>> postRoom(
      {required int idPlace,@Body() required RoomEntity newRoomModel});

  @PUT('/1/update/2')
  Future<HttpResponse<RoomModel>> putRoom(
      {required int idPlace,required int id, @Body() required RoomEntity newRoomModel});

  @DELETE('/1/delete/2')
  Future<HttpResponse<String>> deletRoom({required int idPlace,required int id});
}
