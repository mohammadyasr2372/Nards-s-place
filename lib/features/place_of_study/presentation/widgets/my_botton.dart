import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  const MyBotton({
    super.key, required this.text, required this.colorBotton, required this.colortext,
  });
final String text;
final Color colorBotton;
final Color colortext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:colorBotton ,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 311,
      height: 56,
      child:  Center(
        child: Text(
          text,
          style: TextStyle(
              color:colortext,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
