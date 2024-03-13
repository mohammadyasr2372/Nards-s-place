import 'package:dashbord_cafe/features/place_of_study/data/models/place_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class PlaceDao {
  @Insert()
  Future<void> insertPlace( PlaceModel newPlaceMode);

  @delete
  Future<void> deletPlace( PlaceModel newPlaceMode);

  @Query('SELECT * FROM place')
  Future<List<PlaceModel>> getPlaces();
}
