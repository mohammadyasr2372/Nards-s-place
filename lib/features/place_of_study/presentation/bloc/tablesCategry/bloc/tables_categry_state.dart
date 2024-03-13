
import 'package:dashbord_cafe/features/place_of_study/domain/entities/tables_categry_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class TablesCategryState extends Equatable {
  final List<TablesCategryEntity>? tablesCategrys;
  final TablesCategryEntity? tablesCategry;
  final String? massege;

  final DioException? exception;
  const TablesCategryState({
    this.tablesCategrys,
    this.tablesCategry,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [tablesCategrys, tablesCategry,massege ,exception];
}

class TablesCategrysLoadingState extends TablesCategryState {
  const TablesCategrysLoadingState();
}

class TablesCategrysDoneState extends TablesCategryState {
  const TablesCategrysDoneState(List<TablesCategryEntity> tablesCategrys) : super(tablesCategrys: tablesCategrys);
}

class TablesCategrysErrorState extends TablesCategryState {
  const TablesCategrysErrorState(DioException exception) : super(exception: exception);
}
class PostTablesCategrysDoneState extends TablesCategryState {
  const PostTablesCategrysDoneState(TablesCategryEntity tablesCategry) : super(tablesCategry: tablesCategry);
}

class PutTablesCategrysDoneState extends TablesCategryState {
  const PutTablesCategrysDoneState(TablesCategryEntity tablesCategry) : super(tablesCategry: tablesCategry);
}
class DeletTablesCategrysDoneState extends TablesCategryState {
  const DeletTablesCategrysDoneState(String massege) : super(massege: massege);
}
