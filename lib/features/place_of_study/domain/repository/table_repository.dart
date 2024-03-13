import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';

abstract class TableRepository {
  // API methods
  Future<DataState<List<TableEntity>>> getTables({required int idPlace});

  Future<DataState<TableEntity>> postTable(
      {required int idPlace,required TableEntity newTableEntity});

  Future<DataState<TableEntity>> putTable(
      {required int idPlace,required int id, required TableEntity newTableEntity});

  Future<DataState<String>> deletTable({required int idPlace,required int id});
}
