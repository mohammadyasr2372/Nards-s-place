// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../injection_container.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_bloc.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_event.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_state.dart';
import '../../widgets/shimmer_loading.dart';
import 'room_page.dart';

class RoomsCategryPage extends StatefulWidget {
  const RoomsCategryPage({super.key, required this.idPlace});
  final int idPlace;
  @override
  State<RoomsCategryPage> createState() => _RoomsCategryPageState();
}

class _RoomsCategryPageState extends State<RoomsCategryPage> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // leading: Container(),
        title: Text(
          'Welcome to COSEL',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<RoomsCategryBloc>()
          ..add(GetRoomsCategrys(idPlace: widget.idPlace)),
        child: BlocConsumer<RoomsCategryBloc, RoomsCategryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is RoomsCategrysDoneState) {
              List<RoomPage> pagesRooms = [];
              List<Widget> tabs = [];
              state.roomsCategrys!.forEach((element) {
                tabs.add(Container(
                  // color: Colors.grey,
                  height: height / 10,
                  width: width / 4,
                  child: Tab(
                      text: element.type,
                      icon: FaIcon(
                        (element.id! % 3 == 0)
                            ? FontAwesomeIcons.addressBook
                            : (element.id! % 3 == 1)
                                ? FontAwesomeIcons.peopleGroup
                                : FontAwesomeIcons.accusoft,
                      )
                      // FontAwesomeIcons.peopleGroup FaIcon(FontAwesomeIcons.peopleGroup)
                      ),
                ));
                pagesRooms.add(RoomPage(
                  idCategry: element.id!,
                  idPlace: widget.idPlace,
                ));
              });
              return DefaultTabController(
                length: state.roomsCategrys!.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar.secondary(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        enableFeedback: true,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(45, 141, 153, 187),
                                const Color.fromARGB(255, 238, 106, 106)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        splashBorderRadius:
                            BorderRadius.all(Radius.circular(100)),
                        unselectedLabelColor: Colors.red,
                        labelColor: Colors.white,
                        // indicatorColor: Colors.red,
                        // dividerColor: Colors.red,
                        // controller: TabController(length: 3, vsync: this),
                        tabs: tabs

                        // SizedBox(
                        //   width: width,
                        //   height: height / 10,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: state.roomsCategrys!.length,
                        //     itemBuilder: (context, index) => Tab(
                        //         icon: FaIcon(FontAwesomeIcons.peopleGroup),
                        //         height: 100,
                        //         child: Text(state.roomsCategrys![index].type!)),
                        //   ),
                        // )

                        // Tab(
                        //     icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
                        //     height: 100,
                        //     child: Text('coffe Shop')),
                        // Tab(
                        //     icon: FaIcon(FontAwesomeIcons.schoolLock),
                        //     height: 100,
                        //     child: Text('Study Room')),
                        // Tab(+
                        //     icon: FaIcon(FontAwesomeIcons.peopleRoof),
                        //     height: 100,
                        //     child: Text('Events')),

                        ),
                  ),
                  body: TabBarView(children: pagesRooms),
                ),
              );
            } else if (state is RoomsCategrysErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context
                          .read<RoomsCategryBloc>()
                          .add(GetRoomsCategrys(idPlace: widget.idPlace));
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
        ),
      ),
    );
  }
}
