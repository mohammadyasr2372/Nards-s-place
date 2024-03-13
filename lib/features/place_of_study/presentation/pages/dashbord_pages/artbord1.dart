// ignore_for_file: constant_identifier_names

import 'package:dashbord_cafe/config/di.dart';
import 'package:dashbord_cafe/core/constants/font.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/widgets/my_botton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/constants.dart';
import 'artbord2.dart';

class Artbord1 extends StatelessWidget {
  const Artbord1({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 102, 246),
      body: Column(children: [
        Container(
          width: width,
          height: height * 4.5 / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/dashbord.png'),
            ),
          ),
        ),
        Container(
          width: width,
          height: height * 5.5 / 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 3,
                width: 30,
                color: const Color.fromARGB(255, 83, 102, 246),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: '\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tOngoing\n\n',
                        style: AppTextStyle().TextStyle1()),
                    TextSpan(
                        text: 'Buliding Better \nWorkplaces\n',
                        style: AppTextStyle().TextStyle1()),
                    const TextSpan(
                      text:
                          'Create a unigue ernotional story that\ndescribes better than words',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                  onTap: () {
                    showMenu(
                        context: context,
                        position: RelativeRect.fill,
                        items: List.generate(
                            10,
                            (index) => PopupMenuItem(
                                    child: ListTile(
                                  onTap: () {
                                    config
                                        .get<SharedPreferences>()
                                        .setInt('idPlace', (index + 1));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contaxt) =>
                                                const Artbord2()));
                                  },
                                  title: Text('${index + 1}'),
                                ))));
                  },
                  child: const MyBotton(
                      text: 'Get Strrted',
                      colorBotton: Color.fromARGB(255, 83, 102, 246),
                      colortext: Colors.white))
            ],
          ),
        ),
      ]),
    );
  }
}
