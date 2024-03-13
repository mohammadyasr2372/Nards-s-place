// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';

abstract class TableEvent {
  const TableEvent();
}

class GetTables extends TableEvent {
  int idPlace;
  GetTables({
   required this.idPlace,
  });
   
}


class PostTable extends TableEvent {
  int idPlace;
  TableEntity tableEntity;
   PostTable({required this.idPlace,
    required this.tableEntity,
  });
}


class PutTable extends TableEvent {
  int idPlace;
  TableEntity tableEntity;
  int id;
   PutTable({required this.idPlace,required this.tableEntity,required this.id});
}
class DeletTable extends TableEvent {
  int idPlace;
  int id;

   DeletTable({required this.idPlace,required this.id});
}