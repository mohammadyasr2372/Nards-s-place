// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_event.dart';
import 'package:dashbord_cafe/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../config/di.dart';
import '../../../../../core/constants/font.dart';
import '../../../domain/entities/tables_categry_entity.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_bloc.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_state.dart';
import '../../widgets/shimmer_loading.dart';

TextEditingController num_of_seats = TextEditingController();
TextEditingController shape = TextEditingController();

class TablesCategrysPage extends StatelessWidget {
  const TablesCategrysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tables Categrys'),
          titleTextStyle: AppTextStyle().TextStyle1()),
      body: BlocProvider(
        create: (context) => sl<TablesCategryBloc>()
          ..add(GetTablesCategrys(
              idPlace: config.get<SharedPreferences>().getInt('idPlace') !)),
        child: BlocConsumer<TablesCategryBloc, TablesCategryState>(
          listener: (context, state) {
            if (state is TablesCategrysDoneState) {}
          },
          builder: (context, state) {
            if (state is TablesCategrysDoneState) {
              return (state.tablesCategrys!.isEmpty)
                  ? Center(child: Text('no Tables Categrys Categry yet '))
                  : ListView.builder(
                      itemCount: state.tablesCategrys!.length,
                      itemBuilder: (context, index) {
                        int id = state.tablesCategrys![index].id!;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            hoverColor: Color.fromARGB(255, 59, 161, 215),
                            onLongPress: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    //  backgroundColor: Color.fromARGB(121, 102, 123, 117),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: const Text(
                                      'Edit Table Categry',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Column(
                                        children: [
                                          TextField(
                                              controller: shape,
                                              decoration: InputDecoration(
                                                  hintText: 'NEW Shape')),
                                          TextField(
                                              controller: num_of_seats,
                                              decoration: InputDecoration(
                                                  hintText: 'num of seats')),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      BlocProvider<TablesCategryBloc>(
                                        create: (context) =>
                                            sl<TablesCategryBloc>(),
                                        child: BlocBuilder<TablesCategryBloc,
                                            TablesCategryState>(
                                          builder: (context, state) {
                                            return TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<TablesCategryBloc>()
                                                      .add(PutTablesCategry(
                                                          idPlace: config
                                                                  .get<
                                                                      SharedPreferences>()
                                                                  .getInt(
                                                                      'idPlace') !,
                                                          tablesCategryEntity:
                                                              TablesCategryEntity(
                                                                  num_of_seats:
                                                                      int.parse(
                                                                          num_of_seats
                                                                              .text),
                                                                  shape: shape
                                                                      .text),
                                                          id: id));

                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            title: Text(state.tablesCategrys![index].shape!),
                            subtitle: Text('num of seats' +
                                state.tablesCategrys![index].num_of_seats!
                                    .toString()),
                            titleTextStyle: AppTextStyle().TextStyle1(),
                            trailing: InkWell(
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        //  backgroundColor: Color.fromARGB(121, 102, 123, 117),
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: const Text(
                                          'Delete Table Categry',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: const Text(
                                            'Are you Sure you want to Delete Table Categry'),
                                        actions: [
                                          BlocProvider<TablesCategryBloc>(
                                            create: (context) =>
                                                sl<TablesCategryBloc>(),
                                            child: BlocBuilder<
                                                TablesCategryBloc,
                                                TablesCategryState>(
                                              builder: (context, state) {
                                                return TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              TablesCategryBloc>()
                                                          .add(
                                                              DeletTablesCategry(
                                                            idPlace: config
                                                                    .get<
                                                                        SharedPreferences>()
                                                                    .getInt(
                                                                        'idPlace') !,
                                                            id: id,
                                                          ));

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.delete)),
                          ),
                        );
                      });
            } else if (state is TablesCategrysErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context.read<TablesCategryBloc>().add(GetTablesCategrys(
                          idPlace: config
                                  .get<SharedPreferences>()
                                  .getInt('idPlace') !));
                    },
                    child: const Icon(Icons.refresh_outlined)),
              );
            } else if (state is TablesCategrysLoadingState) {
              return const Center(
                child: ShimmerLoading(),
              );
            } else {
              return Center(
                child: Text(state.toString()),
              );
            }
          },
        ),
      ),
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
                        controller: shape,
                        decoration: InputDecoration(hintText: 'Shape')),
                    TextField(
                        controller: num_of_seats,
                        decoration: InputDecoration(hintText: 'num of seats')),
                  ],
                ),
              ),
              actions: [
                BlocProvider<TablesCategryBloc>(
                  create: (context) => sl<TablesCategryBloc>(),
                  child: BlocBuilder<TablesCategryBloc, TablesCategryState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context.read<TablesCategryBloc>().add(
                                PostTablesCategry(
                                    idPlace: config
                                            .get<SharedPreferences>()
                                            .getInt('idPlace') !,
                                    tablesCategryEntity: TablesCategryEntity(
                                      shape: shape.text,
                                      num_of_seats:
                                          int.parse(num_of_seats.text),
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
