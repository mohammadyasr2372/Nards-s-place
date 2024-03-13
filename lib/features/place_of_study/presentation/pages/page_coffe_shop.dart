// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class PageCoffeShop extends StatelessWidget {
//   const PageCoffeShop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 width: 333,
//                 height: 177,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/labtob.png')),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Coffee Shop',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                           Text(
//                             'Check Our Menu',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Celebrate the irrisistible flavor of coffee in our range of espresso , cocktails and ice drinks',
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 300,
//                 child: Image.asset('assets/images/menu.png'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
