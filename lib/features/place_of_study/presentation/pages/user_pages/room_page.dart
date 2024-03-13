// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_event.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_state.dart';
import 'package:dashbord_cafe/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/room_widget.dart';
import '../../widgets/shimmer_loading.dart';
import 'table_category_page.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key, required this.idPlace, required this.idCategry});
  final int idPlace;
  final int idCategry;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<RoomOfCafesBloc>()
          ..add(GetRoomsByCategry(idPlace: idPlace, idCategry: idCategry)),
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
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TableCategoryPage(
                                    idRoom: state.rooms![index].id!,
                                    idPlace: idPlace,
                                  ),
                                ),
                              );
                            },
                            child: RoomWidget(
                              room: state.rooms![index],
                            ),
                          ),
                        );
                      });
            } else if (state is RoomsErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context
                          .read<RoomOfCafesBloc>()
                          .add(GetRooms(idPlace: idPlace));
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
        ));
  }
}
