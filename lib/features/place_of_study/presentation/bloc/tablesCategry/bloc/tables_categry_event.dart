
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';


abstract class TablesCategryEvent {
  const TablesCategryEvent();
}

class GetTablesCategrys extends TablesCategryEvent {
  int idPlace;
   GetTablesCategrys({required this.idPlace,});
}


class PostTablesCategry extends TablesCategryEvent {
  int idPlace;
  TablesCategryEntity tablesCategryEntity;
   PostTablesCategry({required this.idPlace,
    required this.tablesCategryEntity,
  });
}


class PutTablesCategry extends TablesCategryEvent {
  int idPlace;
  TablesCategryEntity tablesCategryEntity;
  int id;
   PutTablesCategry({required this.idPlace,required this.tablesCategryEntity,required this.id});
}
class DeletTablesCategry extends TablesCategryEvent {
  int id;
  int idPlace;

   DeletTablesCategry({required this.idPlace,required this.id});
}