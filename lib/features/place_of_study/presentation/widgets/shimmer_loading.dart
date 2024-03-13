// ignore_for_file: prefer_const_constructors

import 'package:dashbord_cafe/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 240, 208, 208),
          highlightColor: Color.fromARGB(255, 168, 189, 227),
          child: Container(
            width: width - 50,
            height: (index % 2 == 0) ? height / 5 : height / 8,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
