import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/place_repository.dart';

class GetPlaceUseCase implements UseCase<DataState<List<PlaceEntity>>, void> {
  final PlaceRepository _placeRepository;

  GetPlaceUseCase(this._placeRepository);

  @override
  Future<DataState<List<PlaceEntity>>> call({void params}) {
    return _placeRepository.getPlaces();
  }
}


class GetPlaceInfoUseCase implements UseCase<DataState<PlaceEntity>, int> {
  final PlaceRepository _placeRepository;

  GetPlaceInfoUseCase(this._placeRepository);

  @override
  Future<DataState<PlaceEntity>> call({int? params}) {
    return _placeRepository.getPlaceInfo(idPlace: params!);
  }
}
class PostPlaceUseCase implements UseCase<DataState<PlaceEntity>, PlaceEntity> {
  final PlaceRepository _placeRepository;

  PostPlaceUseCase(this._placeRepository);

  @override
  Future<DataState<PlaceEntity>> call({PlaceEntity? params}) {
    return _placeRepository.postPlace(newPlaceEntity: params!);
  }
}

class PutPlaceUseCase implements UseCase<DataState<PlaceEntity>, PlaceEntity> {
  final PlaceRepository _placeRepository;

  PutPlaceUseCase(this._placeRepository);

  @override
  Future<DataState<PlaceEntity>> call({PlaceEntity? params, int? id}) {
    return _placeRepository.putPlace(newPlaceEntity: params!, id: id!);
  }
}

class DeletPlaceUseCase implements UseCase<DataState<String>, int> {
  final PlaceRepository _placeRepository;

  DeletPlaceUseCase(this._placeRepository);

  @override
  Future<DataState<String>> call({int? params}) {
    return _placeRepository.deletPlace(id: params!);
  }
}

class GetSavedPlaceUseCase implements UseCase<List<PlaceEntity>, void> {
  final PlaceRepository _placeRepository;

  GetSavedPlaceUseCase(this._placeRepository);

  @override
  Future<List<PlaceEntity>> call({void params}) {
    return _placeRepository.getSavedPlaces();
  }
}

class SavePlaceUseCase implements UseCase<void, PlaceEntity> {
  final PlaceRepository _placeRepository;

  SavePlaceUseCase(this._placeRepository);

  @override
  Future<void> call({PlaceEntity? params}) {
    return _placeRepository.savePlace(params!);
  }
}

class RemovePlaceUseCase implements UseCase<void, PlaceEntity> {
  final PlaceRepository _placeRepository;

  RemovePlaceUseCase(this._placeRepository);

  @override
  Future<void> call({PlaceEntity? params}) {
    return _placeRepository.removePlace(params!);
  }
}
