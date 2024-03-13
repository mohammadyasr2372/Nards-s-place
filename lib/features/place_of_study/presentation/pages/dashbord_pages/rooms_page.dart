// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_event.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_state.dart';
import 'package:dashbord_cafe/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/font.dart';
import '../../widgets/room_widget.dart';
import '../../widgets/shimmer_loading.dart';

TextEditingController category_id = TextEditingController();
TextEditingController max_num_of_chairs = TextEditingController();

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('All Rooms '),
          titleTextStyle: AppTextStyle().TextStyle1()),
      body: BlocProvider(
        create: (context) =>
            sl<RoomOfCafesBloc>()..add(GetRooms(idPlace: config.get<SharedPreferences>().getInt('idPlace') !)),
        child: BlocConsumer<RoomOfCafesBloc, RoomState>(
          listener: (context, state) {
            if (state is RoomsLoadingState) {}
          },
          builder: (context, state) {
            if (state is RoomsDoneState) {
              return (state.rooms!.isEmpty)
                  ? Center(child: Text('no room yet '))
                  : ListView.builder(
                      itemCount: state.rooms!.length,
                      itemBuilder: (context, index) {
                        if (state.rooms![index].status == 2) {
                          return Container();
                        } else {
                          return RoomWidget(room: state.rooms![index]);
                        }
                      });
            } else if (state is RoomsErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context
                          .read<RoomOfCafesBloc>()
                          .add(GetRooms(idPlace: config.get<SharedPreferences>().getInt('idPlace') !));
                    },
                    child: const Icon(Icons.refresh_outlined)),
              );
            } else if (state is RoomsLoadingState) {
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
                'Add Room Categry',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    TextField(
                        controller: num_of_seats,
                        decoration: InputDecoration(hintText: 'num of seats')),
                    TextField(
                        controller: category_id,
                        decoration: InputDecoration(hintText: 'category id')),
                  ],
                ),
              ),
              actions: [
                BlocProvider<RoomOfCafesBloc>(
                  create: (context) => sl<RoomOfCafesBloc>(),
                  child: BlocBuilder<RoomOfCafesBloc, RoomState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context.read<RoomOfCafesBloc>().add(PostRoom(
                                idPlace: config.get<SharedPreferences>().getInt('idPlace') !,
                                roomEntity: RoomEntity(
                                  max_num_of_chairs: int.fromEnvironment(
                                      max_num_of_chairs.text),
                                  status: 1,
                                  category_id:
                                      int.fromEnvironment(category_id.text),
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
      child: Icon(Icons.add),
      ),
    );
  }
}
