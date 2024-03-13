// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_state.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/roomsCategry/bloc/rooms_categry_event.dart';
import 'package:dashbord_cafe/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/font.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_bloc.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_state.dart';
import '../../widgets/shimmer_loading.dart';

TextEditingController newName = TextEditingController();

class RoomsCategrysPage extends StatelessWidget {
  const RoomsCategrysPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tables Categrys'),
          titleTextStyle: AppTextStyle().TextStyle1()),
      body: BlocProvider(
          create: (context) => sl<RoomsCategryBloc>()
            ..add(GetRoomsCategrys(
                idPlace:
                    config.get<SharedPreferences>().getInt('idPlace') !)),
          child: BlocConsumer<RoomsCategryBloc, RoomsCategryState>(
            listener: (context, state) {
              if (state is RoomsLoadingState) {}
            },
            builder: (context, state) {
              if (state is RoomsCategrysDoneState) {
                return (state.roomsCategrys!.isEmpty)
                    ? Center(child: Text('no rooms Categrys Categry yet'))
                    : ListView.builder(
                        itemCount: state.roomsCategrys!.length,
                        itemBuilder: (context, index) {
                          int id = state.roomsCategrys![index].id!;

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
                                      content: TextField(
                                          controller: newName,
                                          decoration: InputDecoration(
                                              hintText:
                                                  'NEW name Table Categry')),
                                      actions: [
                                        BlocProvider<RoomsCategryBloc>(
                                          create: (context) =>
                                              sl<RoomsCategryBloc>(),
                                          child: BlocBuilder<RoomsCategryBloc,
                                              RoomsCategryState>(
                                            builder: (context, state) {
                                              return TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            RoomsCategryBloc>()
                                                        .add(PutRoomsCategry(
                                                            idPlace: config
                                                                    .get<
                                                                        SharedPreferences>()
                                                                    .getInt(
                                                                        'idPlace') !,
                                                            roomsCategryEntity:
                                                                RoomsCategryEntity(
                                                                    type: newName
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
                              title: Text(state.roomsCategrys![index].type!),
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
                                            BlocProvider<RoomsCategryBloc>(
                                              create: (context) =>
                                                  sl<RoomsCategryBloc>(),
                                              child: BlocBuilder<
                                                  RoomsCategryBloc,
                                                  RoomsCategryState>(
                                                builder: (context, state) {
                                                  return TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                RoomsCategryBloc>()
                                                            .add(
                                                                DeletRoomsCategry(
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
                                                                FontWeight
                                                                    .bold),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
              } else if (state is RoomsCategrysErrorState) {
                return Center(
                  child: InkWell(
                      onTap: () {
                        context.read<RoomsCategryBloc>().add(GetRoomsCategrys(
                            idPlace: config
                                    .get<SharedPreferences>()
                                    .getInt('idPlace')!));
                      },
                      child: const Icon(Icons.refresh_outlined)),
                );
              } else if (state is RoomsCategrysLoadingState) {
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
                'Add Room Categry',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: TextField(
                  controller: newName,
                  decoration: InputDecoration(hintText: ' type')),
              actions: [
                BlocProvider<RoomsCategryBloc>(
                  create: (context) => sl<RoomsCategryBloc>(),
                  child: BlocBuilder<RoomsCategryBloc, RoomsCategryState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context
                                .read<RoomsCategryBloc>()
                                .add(PostRoomsCategry(
                                  idPlace: config
                                          .get<SharedPreferences>()
                                          .getInt('idPlace')!,
                                  roomsCategryEntity: RoomsCategryEntity(),
                                ));

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
