
// // ignore_for_file: prefer_const_constructors

// import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/reservattion/bloc/reservation_bloc.dart';
// import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/reservattion/bloc/reservation_event.dart';
// import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/reservattion/bloc/reservation_state.dart';
// import 'package:dashbord_cafe/features/place_of_study/presentation/widgets/reservation_tile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PageEvents extends StatelessWidget {
//   const PageEvents({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: _buildBody(), );
//   }
// }
// _buildBody() {
//     return BlocBuilder<ReservationBloc, ReservationState>(
//       builder: (_, state) {
//         if (state is ReservationsLoadingState) {
//           return const Center(child: CupertinoActivityIndicator());
//         } else if (state is ReservationsErrorState) {
//           return Center(child: Builder(builder: (context) {
//             return InkWell(
//                 onTap: () {
//                   context.read<ReservationBloc>().add(GetReservations());
//                 },
//                 child: Icon(Icons.refresh));
//           }));
//         } else if (state is ReservationsDoneState) {
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return ReservationWidject(
//                 reservation: state.reservations![index],
//                 onReservationPressed: (article) => {},
//               );
//             },
//             itemCount: state.reservations!.length,
//           );
//         } else if (state is PostReservationsDoneState) {
//           return Center(child: Builder(builder: (context) {
//             return InkWell(
//                 onTap: () {
//                   context.read<ReservationBloc>().add(GetReservations());
//                 },
//                 child: Icon(Icons.refresh));
//           }));
//         }
//         return Center(child: Text(state.toString()));
//       },
//     );
//   }