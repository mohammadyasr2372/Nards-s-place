// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';

abstract class PlaceOfCafesEvent {
  const PlaceOfCafesEvent();
}

class GetPlaces extends PlaceOfCafesEvent {
  const GetPlaces();
}

class GetPlaceInfo extends PlaceOfCafesEvent {
  int idPlace;
   GetPlaceInfo({required this.idPlace});
}


class PostPlace extends PlaceOfCafesEvent {
  PlaceEntity placeEntity;
   PostPlace({
    required this.placeEntity,
  });
}


class PutPlace extends PlaceOfCafesEvent {
  PlaceEntity placeEntity;
  int id;
   PutPlace({required this.placeEntity,required this.id});
}
class DeletPlace extends PlaceOfCafesEvent {
  int id;

   DeletPlace({required this.id});
}



abstract class LocalPlacesEvent extends PlaceOfCafesEvent {
  final PlaceEntity ? place;

  const LocalPlacesEvent({this.place});

  List<Object> get props => [place!];
}

class GetSavedPlaces extends LocalPlacesEvent {
  const GetSavedPlaces();
}

class RemovePlace extends LocalPlacesEvent {
  const RemovePlace(PlaceEntity place) : super(place: place);
}

class SavePlace extends LocalPlacesEvent {
  const SavePlace(PlaceEntity place) : super(place: place);
}
