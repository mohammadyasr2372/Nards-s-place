
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';


abstract class RoomsCategryEvent {
  const RoomsCategryEvent();
}

class GetRoomsCategrys extends RoomsCategryEvent {
  int idPlace;
   GetRoomsCategrys({required this.idPlace});
}


class PostRoomsCategry extends RoomsCategryEvent {
  int idPlace;
  RoomsCategryEntity roomsCategryEntity;
   PostRoomsCategry({required this.idPlace,
    required this.roomsCategryEntity,
  });
}


class PutRoomsCategry extends RoomsCategryEvent {
  int idPlace;
  RoomsCategryEntity roomsCategryEntity;
  int id;
   PutRoomsCategry({required this.idPlace,required this.roomsCategryEntity,required this.id});
}
class DeletRoomsCategry extends RoomsCategryEvent {
  int idPlace;
  int id;

   DeletRoomsCategry({required this.idPlace,required this.id});
}