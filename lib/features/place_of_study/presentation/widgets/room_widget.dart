
// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:dashbord_cafe/features/place_of_study/domain/entities/room_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/font.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/reservation_entity.dart';
import '../bloc/reservation_room/bloc/reservation_room_bloc.dart';
import '../bloc/reservation_room/bloc/reservation_room_event.dart';
import '../bloc/reservation_room/bloc/reservation_room_state.dart';

TextEditingController num_of_seats = TextEditingController();
TextEditingController period_of_reservations = TextEditingController();
class RoomWidget extends StatefulWidget {
  final RoomEntity room;
  const RoomWidget({
    super.key,
    required this.room,
  });

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime dateReservation = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: 333,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xff7B9DE2),
              Color(0xff3B3BC0),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
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
                              height: 170,
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
                                    setState(() {
                                      dateReservation = DateTime(
                                          newDate.year,
                                          newDate.month,
                                          newDate.day,
                                          newtime.hour,
                                          newtime.minute,
                                          newDate.second);
                                    });
                                  },
                                  child: Text(
                                      
                                      '${dateReservation.day}/${Months.values[dateReservation.month - 1].name}/${dateReservation.year}\n${dateReservation.hour}:${dateReservation.minute}:00'),
                                ),
                                TextField(
                                    controller: period_of_reservations,
                                    decoration: const InputDecoration(
                                        hintText: 'period_of_reservations')),
                                TextField(
                                    controller: num_of_seats,
                                    decoration: const InputDecoration(
                                        hintText: 'num_of_seats')),
                              ]),
                            ),
                            actions: [
                              BlocProvider(
                                create: (context) => sl<ReservationRoomBloc>(),
                                child: BlocBuilder<ReservationRoomBloc,
                                    ReservationRoomState>(
                                  builder: (context, state) {
                                    return TextButton(
                                      onPressed: () {
                                        context
                                            .read<ReservationRoomBloc>()
                                            .add(PostReservationRooms(
                                                idPlace: 1,
                                                reservationRoomsEntity:
                                                    ReservationEntity(
                                                        time:
                                                            '${dateReservation.year}-${dateReservation.month}-${dateReservation.day}T${dateReservation.hour}:${dateReservation.minute}:00',
                                                        num_of_seats: int.parse(
                                                            num_of_seats.text),
                                                        room_id:
                                                            widget.room.id,
                                                        period_of_reservations:
                                                            int.parse(
                                                                period_of_reservations
                                                                    .text))));

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
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 120,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          'Add Book',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Looking for a safe studing Room?',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'max num of chairs : ${widget.room.max_num_of_chairs}',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/cafe${widget.room.id!}.jpg'))),
            )
          ],
        ),
      ),
    );
  }
}

