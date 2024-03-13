// ignore_for_file: constant_identifier_names
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/roomsCategry/bloc/rooms_categry_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/core/constants/font.dart';
import 'package:flutter/material.dart';

import '../../bloc/room/bloc/room_bloc.dart';
import '../../bloc/room/bloc/room_state.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_state.dart';
import '../../bloc/table/bloc/table_state.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_bloc.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_state.dart';
import 'rooms_categrys_page.dart';
import 'rooms_page.dart';
import 'tables_categrys_page.dart';
import 'tables_page.dart';

class HomeArtbord2 extends StatelessWidget {
  const HomeArtbord2({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '\t\t\tHi Surf.\n',
                        style: AppTextStyle().TextStyle1()),
                    TextSpan(
                        text: '5 Tasks are predning',
                        style: AppTextStyle().TextStyle3(
                            color: const Color.fromARGB(255, 197, 162, 162)))
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width - 50,
              height: height * 1.3 / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xff7B9DE2),
                    Color(0xff3B3BC0),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Information Architecture',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height * 0.1 / 10,
                    ),
                    const Text(
                      'Sers & caer',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'Monthly preview',
            style: AppTextStyle().TextStyle1(),
          ),
          SizedBox(
            height: height * 4 / 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            width: (width / 2) - 25,
                            height: height * 2 / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const RadialGradient(
                                colors: <Color>[
                                  Color.fromARGB(255, 233, 239, 249),
                                  Color.fromARGB(255, 128, 225, 161),
                                ],
                              ),
                            ),
                            child: BlocConsumer<RoomOfCafesBloc, RoomState>(
                              listener: (context, state) {
                              },
                              builder: (context, state) {
                                int roomIsAvailable = 0;
                                if (state is RoomsDoneState) {
                                  for (var element in state.rooms!) {
                                    if (element.status == 1) {
                                      roomIsAvailable++;
                                    }
                                  }
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contaxt) => const RoomsPage()));
                                    },
                                    child: Center(
                                      child: Text.rich(
                                          textAlign: TextAlign.center,
                                          TextSpan(children: [
                                            TextSpan(
                                                text: '$roomIsAvailable\n',
                                                style: AppTextStyle()
                                                    .TextStyle1(
                                                        color: Colors.white)),
                                            TextSpan(
                                                text: 'Available Room',
                                                style: AppTextStyle()
                                                    .TextStyle3()),
                                          ])),
                                    ),
                                  );
                                } else if (state is RoomsErrorState) {
                                  return Center(
                                      child: Text(state.exception.toString()));
                                } else if (state is RoomsLoadingState) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Center(child: Text(state.toString()));
                                }
                              },
                            )),
                        SizedBox(
                          height: height * 0.25 / 10,
                        ),
                        Container(
                          width: (width / 2) - 25,
                          height: height * 1 / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 244, 113, 196),
                                Color.fromARGB(255, 195, 80, 80),
                              ],
                            ),
                          ),
                          child:
                              BlocConsumer<RoomsCategryBloc, RoomsCategryState>(
                            listener: (context, state) {
                               },
                            builder: (context, state) {
                              if (state is RoomsCategrysDoneState) {
                                return InkWell(
                                  onTap: () {},
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contaxt) =>
                                                  const RoomsCategrysPage()));
                                    },
                                    child: Center(
                                      child: Text.rich(
                                          textAlign: TextAlign.center,
                                          TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    '${state.roomsCategrys!.length}\n',
                                                style: AppTextStyle()
                                                    .TextStyle1(
                                                        color: Colors.white)),
                                            TextSpan(
                                                text: 'Rooms Categry',
                                                style: AppTextStyle()
                                                    .TextStyle3()),
                                          ])),
                                    ),
                                  ),
                                );
                              } else if (state is RoomsCategrysErrorState) {
                                return Center(
                                    child: Text(state.exception.toString()));
                              } else if (state is RoomsCategrysLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Center(child: Text(state.toString()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: (width / 2) - 25,
                          height: height * 1 / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 214, 164, 45),
                                Color.fromARGB(255, 168, 192, 59),
                              ],
                            ),
                          ),
                          child: BlocConsumer<TablesCategryBloc,
                              TablesCategryState>(
                            listener: (context, state) {
                              },
                            builder: (context, state) {
                              if (state is TablesCategrysDoneState) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contaxt) =>
                                                const TablesCategrysPage()));
                                  },
                                  child: Center(
                                    child: Text.rich(
                                        textAlign: TextAlign.center,
                                        TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  '${state.tablesCategrys!.length}\n',
                                              style: AppTextStyle().TextStyle1(
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: 'Tables Categry',
                                              style:
                                                  AppTextStyle().TextStyle3()),
                                        ])),
                                  ),
                                );
                              } else if (state is TablesCategrysErrorState) {
                                return Center(
                                    child: Text(state.exception.toString()));
                              } else if (state is TablesCategrysLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Center(child: Text(state.toString()));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.25 / 10,
                        ),
                        Container(
                          width: (width / 2) - 25,
                          height: height * 2 / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0xff7B9DE2),
                                Color.fromARGB(255, 134, 134, 198),
                              ],
                            ),
                          ),
                          child: BlocConsumer<TableBloc, TableState>(
                            listener: (context, state) {
                            },
                            builder: (context, state) {
                              int tableIsAvailable = 0;
                              if (state is TablesDoneState) {
                                for (var element in state.tables!) {
                                  if (element.status == 1) {
                                    tableIsAvailable++;
                                  }
                                }
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contaxt) => const TablesPage()));
                                  },
                                  child: Center(
                                    child: Text.rich(
                                        textAlign: TextAlign.center,
                                        TextSpan(children: [
                                          TextSpan(
                                              text: '$tableIsAvailable\n',
                                              style: AppTextStyle().TextStyle1(
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: 'Table Available',
                                              style:
                                                  AppTextStyle().TextStyle3()),
                                        ])),
                                  ),
                                );
                              } else if (state is TablesErrorState) {
                                return Center(
                                    child: Text(state.exception.toString()));
                              } else if (state is TablesLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Center(child: Text(state.toString()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
