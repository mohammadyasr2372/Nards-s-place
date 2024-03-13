import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/place_model.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'place_api_service.g.dart';

@RestApi(baseUrl: placeAPIBaseURL)
abstract class PlaceApiService {
  factory PlaceApiService(Dio dio) = _PlaceApiService;

  @GET('/allplaces')
  Future<HttpResponse<List<PlaceModel>>> getPlaces();

@GET('/show/1')
  Future<HttpResponse<PlaceModel>> getPlaceInfo({required int idPlace});

  @POST('/newplace')
  Future<HttpResponse<PlaceModel>> postPlace(
      {@Body() required PlaceEntity newPlaceModel});

  @PUT('/edit/1')
  Future<HttpResponse<PlaceModel>> putPlace(
      {required int id, @Body() required PlaceEntity newPlaceModel});
  @DELETE('/delete/1')
  Future<HttpResponse<String>> deletPlace({required int id});
}
