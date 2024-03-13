// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/place_entity.dart';
import 'package:flutter/material.dart';

import '../pages/user_pages/rooms_categry_page.dart';

class PlaceWidget extends StatelessWidget {
  final PlaceEntity place;
  const PlaceWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 50,
        width: width - 50,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomsCategryPage(
                      idPlace: place.id!,
                    ),
                  ),
                );
              },
              child: Container(
                width: 333,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
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
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                place.name!,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Text(
                            'Looking for a safe studing place?',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'locations : ' + place.location!,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/cafe${place.id!}.jpg'),)),child: InkWell(child: Icon(Icons.favorite_border)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: Text(
                'COSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.  ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("assets/images/wifi.png"),
                    title: Text(
                      'Hight speed internet',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/pro.png"),
                    title: Text(
                      'Projector',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/board.png"),
                    title: Text(
                      'Withe Board',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
