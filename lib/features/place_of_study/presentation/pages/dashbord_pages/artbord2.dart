// ignore_for_file: constant_identifier_names
import 'package:dashbord_cafe/core/constants/font.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/roomsCategry/bloc/rooms_categry_event.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/table/bloc/table_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../injection_container.dart';
import '../../bloc/reservation_room/bloc/reservation_room_bloc.dart';
import '../../bloc/reservation_room/bloc/reservation_room_event.dart';
import '../../bloc/reservation_table/bloc/reservation_table_bloc.dart';
import '../../bloc/reservation_table/bloc/reservation_table_event.dart';
import '../../bloc/room/bloc/room_bloc.dart';
import '../../bloc/room/bloc/room_event.dart';
import '../../bloc/roomsCategry/bloc/rooms_categry_bloc.dart';
import '../../bloc/table/bloc/table_bloc.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_bloc.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_event.dart';
import 'calendar_room.dart';
import 'calender_table.dart';
import 'home_artbord2.dart';
import 'profile_page.dart';

class Artbord2 extends StatefulWidget {
  const Artbord2({super.key});

  @override
  State<Artbord2> createState() => _Artbord2State();
}

int selectedIndex = 0;
List<Widget> pages = [
  const HomeArtbord2(),
  CalendarRoom(),
  CalendarTable(),
  const ProfilePlace()
];

class _Artbord2State extends State<Artbord2> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    DateTime newdate = DateTime.now();
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoomOfCafesBloc>(
          create: (context) => sl<RoomOfCafesBloc>()
            ..add(GetRooms(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
        BlocProvider<TableBloc>(
          create: (context) => sl<TableBloc>()
            ..add(GetTables(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
        BlocProvider<RoomsCategryBloc>(
          create: (context) => sl<RoomsCategryBloc>()
            ..add(GetRoomsCategrys(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
        BlocProvider<TablesCategryBloc>(
          create: (context) => sl<TablesCategryBloc>()
            ..add(GetTablesCategrys(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
        BlocProvider<ReservationRoomBloc>(
          create: (context) => sl<ReservationRoomBloc>()
            ..add(GetReservationsRooms(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
        BlocProvider(
          create: (context) => sl<ReservationTableBloc>()
            ..add(GetReservationsTables(
                idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: height * 2 / 10,
              leading: Container(),
              title: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: '${WeekDays.values[(newdate.weekday) - 1].name}\n',
                      style: AppTextStyle().TextStyle1()),
                  TextSpan(
                      text:
                          '${newdate.day} ${Months.values[(newdate.month) - 1].name}\n',
                      style: AppTextStyle().TextStyle1())
                ]),
              ),
              actions: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.search),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
              ]),
          body: pages[selectedIndex],
          bottomNavigationBar: NavigationBar(
            height: height / 10,
            backgroundColor: Colors.white,
            elevation: 0,
            // indicatorShape: CircleBorder(),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            // animationDuration: Duration(seconds: 3),
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'HomePage'),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Calendar Room'),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Calendar Table'),
              NavigationDestination(
                  icon: Icon(Icons.person), label: 'profaile'),
            ],
          )),
    );
  }
}
