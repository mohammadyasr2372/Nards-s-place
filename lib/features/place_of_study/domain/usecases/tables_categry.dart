import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/tables_categry_repository.dart';

class GetTablesCategryUseCase
    implements UseCase<DataState<List<TablesCategryEntity>>, int> {
  final TablesCategryRepository _tablesCategryRepository;

  GetTablesCategryUseCase(this._tablesCategryRepository);

  @override
  Future<DataState<List<TablesCategryEntity>>> call({int? params}) {
    return _tablesCategryRepository.getTablesCategrys(idPlace: params!);
  }
}

class PostTablesCategryUseCase
    implements UseCase<DataState<TablesCategryEntity>, TablesCategryEntity> {
  final TablesCategryRepository _tablesCategryRepository;

  PostTablesCategryUseCase(this._tablesCategryRepository);

  @override
  Future<DataState<TablesCategryEntity>> call({TablesCategryEntity? params, int? idPlace}) {
    return _tablesCategryRepository.postTablesCategry(
        newTablesCategryEntity: params!, idPlace: idPlace!);
  }
}

class PutTablesCategryUseCase
    implements UseCase<DataState<TablesCategryEntity>, TablesCategryEntity> {
  final TablesCategryRepository _tablesCategryRepository;

  PutTablesCategryUseCase(this._tablesCategryRepository);

  @override
  Future<DataState<TablesCategryEntity>> call(
      {TablesCategryEntity? params, int? id, int? idPlace}) {
    return _tablesCategryRepository.putTablesCategry(
        newTablesCategryEntity: params!, id: id!, idPlace: idPlace!);
  }
}

class DeletTablesCategryUseCase implements UseCase<DataState<String>, int> {
  final TablesCategryRepository _tablesCategryRepository;

  DeletTablesCategryUseCase(this._tablesCategryRepository);

  @override
  Future<DataState<String>> call({int? params, int? idPlace}) {
    return _tablesCategryRepository.deletTablesCategry(id: params!, idPlace: idPlace!);
  }
}
