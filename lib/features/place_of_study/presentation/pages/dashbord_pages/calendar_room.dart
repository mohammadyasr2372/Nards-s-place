// ignore_for_file: constant_identifier_names, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/reservation_room/bloc/reservation_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../core/constants/font.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/reservation_entity.dart';
import '../../bloc/reservation_room/bloc/reservation_room_event.dart';
import '../../bloc/reservation_room/bloc/reservation_room_state.dart';
import '../../widgets/shimmer_loading.dart';

TextEditingController num_of_seats = TextEditingController();
TextEditingController room_id = TextEditingController();
TextEditingController period_of_reservations = TextEditingController();

class CalendarRoom extends StatelessWidget {
  CalendarRoom({super.key});
  List<List<Color>> colors = [
    <Color>[
      const Color(0xff7B9DE2),
      const Color(0xff3B3BC0),
    ],
    <Color>[
      const Color.fromARGB(255, 226, 123, 190),
      const Color.fromARGB(255, 120, 11, 130),
    ],
    <Color>[
      const Color.fromARGB(255, 216, 226, 123),
      const Color.fromARGB(255, 143, 192, 59),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    DateTime dateReservation = DateTime.now();
    return Scaffold(
      body: BlocConsumer<ReservationRoomBloc, ReservationRoomState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetReservationsRoomDoneState) {
            return ListView.builder(
              itemCount: state.reservationsRoom!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: width - 50,
                    height: height * 1.3 / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: colors[(index % 3 == 0)
                              ? 1
                              : (index % 3 == 1)
                                  ? 0
                                  : 2]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.reservationsRoom![index].place!.name!,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: height * 0.1 / 10,
                          ),
                          Text(
                            'number of seats :${state.reservationsRoom![index].number_of_seats}\nperiod of reservations :${state.reservationsRoom![index].period_of_reservations}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ReservationsRoomErrorState) {
            return Center(
              child: InkWell(
                  onTap: () {
                    context
                        .read<ReservationRoomBloc>()
                        .add(GetReservationsRooms(idPlace: config.get<SharedPreferences>().getInt('idPlace') !));
                  },
                  child: const Icon(Icons.refresh_outlined)),
            );
          } else if (state is ReservationsRoomLoadingState) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                  'Add Book Rserrvation Rooms',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: SizedBox(
                  height: 150,
                  child: Column(children: [
                    InkWell(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateReservation,
                            firstDate: dateReservation,
                            lastDate: DateTime(2030));
                        if (newDate == null) {
                          return;
                        }
                        TimeOfDay? newtime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: dateReservation.hour,
                                minute: dateReservation.minute));
                        if (newtime == null) {
                          return;
                        }

                        dateReservation = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            newtime.hour,
                            newtime.minute,
                            newDate.second);
                      },
                      child: Text(
                          style: AppTextStyle().TextStyle1(),
                          '${dateReservation.day}/${Months.values[dateReservation.month - 1].name}/${dateReservation.year}\n${dateReservation.hour}:${dateReservation.minute}:00'),
                    ),
                    TextField(
                        controller: period_of_reservations,
                        decoration: const InputDecoration(
                            hintText: 'period_of_reservations')),
                    TextField(
                        controller: num_of_seats,
                        decoration:
                            const InputDecoration(hintText: 'num_of_seats')),
                  ]),
                ),
                actions: [
                  BlocProvider(
                    create: (context) => sl<ReservationRoomBloc>(),
                    child:
                        BlocBuilder<ReservationRoomBloc, ReservationRoomState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            context.read<ReservationRoomBloc>().add(
                                PostReservationRooms(
                                    idPlace: config.get<SharedPreferences>().getInt('idPlace') !,
                                    reservationRoomsEntity: ReservationEntity(
                                        time:
                                            '${dateReservation.year}-${dateReservation.month}-${dateReservation.day}T${dateReservation.hour}:${dateReservation.minute}:00',
                                        num_of_seats:
                                            int.parse(num_of_seats.text),
                                        room_id: int.parse(room_id.text),
                                        period_of_reservations: int.parse(
                                            period_of_reservations.text))));

                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        );
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
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
    );
  }
}
