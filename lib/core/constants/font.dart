// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle TextStyle1({Color? color}) {

    return  TextStyle(color: color??Colors.black,fontSize: 32, fontWeight: FontWeight.w700);
  }

  TextStyle TextStyle2() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  }

  TextStyle TextStyle3({Color? color}) {
    return  TextStyle(
        color: color??Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  }
}
