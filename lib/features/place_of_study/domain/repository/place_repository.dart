import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';

abstract class PlaceRepository {
  // API methods
  Future<DataState<List<PlaceEntity>>> getPlaces();
  Future<DataState<PlaceEntity>> getPlaceInfo({required int idPlace});

  Future<DataState<PlaceEntity>> postPlace(
      {required PlaceEntity newPlaceEntity});

  Future<DataState<PlaceEntity>> putPlace(
      {required int id, required PlaceEntity newPlaceEntity});

  Future<DataState<String>> deletPlace({required int id});


  
  // Database methods
  Future < List < PlaceEntity >> getSavedPlaces();

  Future < void > savePlace(PlaceEntity place);

  Future < void > removePlace(PlaceEntity place);
}
