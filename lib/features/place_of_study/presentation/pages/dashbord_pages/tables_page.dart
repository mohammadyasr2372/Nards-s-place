// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously


import 'package:dashbord_cafe/features/place_of_study/domain/entities/table_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_state.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_event.dart';
import 'package:dashbord_cafe/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/font.dart';
import '../../bloc/table/bloc/table_bloc.dart';
import '../../bloc/table/bloc/table_state.dart';
import '../../widgets/shimmer_loading.dart';
import '../../widgets/table_widget.dart';

TextEditingController category_id = TextEditingController();
TextEditingController room_id = TextEditingController();
TextEditingController num_of_seats = TextEditingController();
TextEditingController period_of_reservations = TextEditingController();

class TablesPage extends StatelessWidget {
const TablesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('All Tables '),
          titleTextStyle: AppTextStyle().TextStyle1()),
      body: BlocProvider(
          create: (context) =>
              sl<TableBloc>()..add(GetTables(idPlace: config.get<SharedPreferences>().getInt('idPlace') !)),
          child: BlocConsumer<TableBloc, TableState>(
            listener: (context, state) {
              if (state is RoomsLoadingState) {}
            },
            builder: (context, state) {
              if (state is TablesDoneState) {
                return (state.tables!.isEmpty)
                    ? Center(child: Text('no table yet '))
                    : ListView.builder(
                        itemCount: state.tables!.length,
                        itemBuilder: (context, index) {
                          if (state.tables![index].status == 2) {
                            return Container();
                          }
                          return TableWidget(table: state.tables![index]);
                        });
              } else if (state is TablesErrorState) {
                return Center(
                  child: InkWell(
                      onTap: () {
                        context
                            .read<TableBloc>()
                            .add(GetTables(idPlace: config.get<SharedPreferences>().getInt('idPlace') !));
                      },
                      child: const Icon(Icons.refresh_outlined)),
                );
              } else if (state is TablesLoadingState) {
                return const Center(
                  child: ShimmerLoading(),
                );
              } else {
                return Center(
                  child: Text(state.toString()),
                );
              }
            },
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              //  backgroundColor: Color.fromARGB(121, 102, 123, 117),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text(
                'Add Table Categry',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    TextField(
                        controller: room_id,
                        decoration: InputDecoration(hintText: 'room_id')),
                    TextField(
                        controller: category_id,
                        decoration: InputDecoration(hintText: 'category id')),
                  ],
                ),
              ),
              actions: [
                BlocProvider<TableBloc>(
                  create: (context) => sl<TableBloc>(),
                  child: BlocBuilder<TableBloc, TableState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context.read<TableBloc>().add(PostTable(
                                idPlace: config
                                        .get<SharedPreferences>()
                                        .getInt('idPlace') !,
                                tableEntity: TableEntity(
                                  status: 1,
                                  room_id: int.parse(room_id.text),
                                  category_id: int.parse(category_id.text),
                                )));

                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ));
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),),
    );
  }
}
