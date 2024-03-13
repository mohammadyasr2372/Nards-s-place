
import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class TableState extends Equatable {
  final List<TableEntity>? tables;
  final TableEntity? table;
  final String? massege;

  final DioException? exception;
  const TableState({
    this.tables,
    this.table,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [tables, table,massege ,exception];
}

class TablesLoadingState extends TableState {
  const TablesLoadingState();
}

class TablesDoneState extends TableState {
  const TablesDoneState(List<TableEntity> tables) : super(tables: tables);
}

class TablesErrorState extends TableState {
  const TablesErrorState(DioException exception) : super(exception: exception);
}
class PostTablesDoneState extends TableState {
  const PostTablesDoneState(TableEntity table) : super(table: table);
}

class PutTablesDoneState extends TableState {
  const PutTablesDoneState(TableEntity table) : super(table: table);
}
class DeletTablesDoneState extends TableState {
  const DeletTablesDoneState(String massege) : super(massege: massege);
}
