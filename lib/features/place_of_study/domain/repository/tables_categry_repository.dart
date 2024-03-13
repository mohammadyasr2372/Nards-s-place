import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';

abstract class TablesCategryRepository {
  // API methods
  Future<DataState<List<TablesCategryEntity>>> getTablesCategrys({required int idPlace});

  Future<DataState<TablesCategryEntity>> postTablesCategry(
      {required int idPlace,required TablesCategryEntity newTablesCategryEntity});

  Future<DataState<TablesCategryEntity>> putTablesCategry(
      {required int idPlace,required int id, required TablesCategryEntity newTablesCategryEntity});

  Future<DataState<String>> deletTablesCategry({required int idPlace,required int id});
}
