// ignore_for_file: prefer_const_constructors

import 'package:dashbord_cafe/core/constants/font.dart';

import 'login_page.dart';

import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import 'sign_up_page.dart';

class PageFirst extends StatelessWidget {
  const PageFirst({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(height * 0.5 / 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/cosel logo.png',
              height: height * 3 / 15,
            ),
            SizedBox(
              height: height * 4 / 10,
              child: Align(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(children:  [
                  TextSpan(
                    text: 'LOOKING FOR A COZY STUDY SPOT\n',
                    style: AppTextStyle().TextStyle1(),
                  ),
                  TextSpan(
                    text:
                        '\nCOSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.',
                    style: AppTextStyle().TextStyle2(),
                  ),
                ])),
              ),
            ),
            // SizedBox(height: height / 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageLogin(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffF05984),
                    width: 1,
                  ),
                  color: Color(0xffF05984),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 311,
                height: height * 1 / 15,
                child: Center(
                  child: Text(
                    'Login',
                    style: AppTextStyle().TextStyle3(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageSignup()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff3B3A36),
                    width: 2,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 311,
                height: height * 1 / 15,
                child: Center(
                  child: Text(
                    'Create account',
                    style: TextStyle(
                        color: Color(0xff3B3A36),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
