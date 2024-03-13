// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_event.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../injection_container.dart';
import '../../widgets/table_widget.dart';

class TablePage extends StatelessWidget {
  const TablePage(
      {super.key,
      required this.idRoom,
      required this.idCategry,
      required this.idPlace});
  final int idRoom;
  final int idPlace;
  final int idCategry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocProvider(
          create: (context) =>
              sl<TableBloc>()..add(GetTables(idPlace: idPlace)),
          child: BlocConsumer<TableBloc, TableState>(
            listener: (context, state) {
              if (state is TablesLoadingState) {}
            },
            builder: (context, state) {
              if (state is TablesDoneState) {
                List<TableEntity> TablesByCategry = [];
                for (var element in state.tables!) {
                  if (element.available_seats == idCategry) {
                    TablesByCategry.add(element);
                  }
                }
                return (TablesByCategry.isEmpty)
                    ? Center(child: Text('no Table yet '))
                    : ListView.builder(
                        itemCount: TablesByCategry.length,
                        itemBuilder: (context, index) {
                            if (state.tables![index].status == 2) {
                              return Container();
                            }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableWidget(
                              table: TablesByCategry[index],
                            ),
                          );
                        });
              } else if (state is TablesErrorState) {
                return Center(child: Text(state.exception!.message!));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
