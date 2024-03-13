// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class PageStudyRoom extends StatelessWidget {
//   const PageStudyRoom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: 333,
//               height: 140,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color(0xff7B9DE2),
//                     Color(0xff3B3BC0),
//                   ],
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(
//                     width: 160,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 120,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           child: Center(
//                             child: Text(
//                               '12 Spots available',
//                               style: TextStyle(
//                                   fontSize: 12, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Down Staires Room ',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           'Welcome to COSEL',
//                           style: TextStyle(fontSize: 10, color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   Image.asset('assets/images/house.png')
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'COSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.  ',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             Container(
//               width: 333,
//               height: 140,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color(0xff7B9DE2),
//                     Color(0xff3B3BC0),
//                   ],
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(
//                     width: 160,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 120,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           child: Center(
//                             child: Text(
//                               '36 Spots available',
//                               style: TextStyle(
//                                   fontSize: 12, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Up Staires Room ',
//                           style: TextStyle(
//                               fontSize: 24,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           'Welcome to COSEL',
//                           style: TextStyle(fontSize: 10, color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   Image.asset('assets/images/house.png')
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
