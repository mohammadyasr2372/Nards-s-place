// ignore_for_file: use_build_context_synchronously

import 'package:dashbord_cafe/features/place_of_study/presentation/pages/user_pages/base_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../injection_container.dart';
import '../../widgets/my_botton.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
bool obscureText = true;

class _PageLoginState extends State<PageLogin> {
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 6,
        title: const Text(
          'Login',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(height * 0.2 / 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: height / ,
                  // ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        label: const Text('Email or username'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: height * 0.2 / 6,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: obscureText,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffix: InkWell(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(obscureText
                                ? Icons.remove_red_eye_sharp
                                : Icons.remove_red_eye_outlined)),
                        label: const Text('Password'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                    color: Color(0xffF05984),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'OR SING IN WITH',
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 153, 237),
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff1877F2),
                  width: 1,
                ),
                color: const Color(0xff1877F2),
                borderRadius: BorderRadius.circular(16),
              ),
              width: 328,
              height: 54,
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.facebook,
                    ),
                    Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Basepage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 3.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 328,
                height: 54,
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.google,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: Color.fromARGB(255, 151, 124, 124),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    if (_formSignInKey.currentState!.validate()) {
                      final credential;
                      try {
                        credential =
                            await sl<FirebaseAuth>().signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Basepage()));
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(e.code),
                          ),
                        );
                      }
                    } else if (!_formSignInKey.currentState!.validate()) {}
                  },
                  child: const MyBotton(
                    text: 'Login',
                    colorBotton: Color.fromARGB(255, 240, 228, 232),
                    colortext: Color.fromARGB(255, 130, 105, 105),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
