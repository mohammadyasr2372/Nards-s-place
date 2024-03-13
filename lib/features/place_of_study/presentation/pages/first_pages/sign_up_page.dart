// import 'package:icons_plus/icons_plus.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:dashbord_cafe/features/place_of_study/presentation/pages/user_pages/base_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../injection_container.dart';

class PageSignup extends StatefulWidget {
  const PageSignup({super.key});

  @override
  State<PageSignup> createState() => _PageSignupState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();

class _PageSignupState extends State<PageSignup> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text(
          'Create Account',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formSignInKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your firstName';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('First Name'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your lastName';
                          
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Last Name'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Email'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 25.0,
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
                                child: const Icon(Icons.remove_red_eye_sharp)),
                            label: const Text('Password'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: confirmpassword,
                        obscureText: obscureText,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm Password';
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
                                child: const Icon(Icons.remove_red_eye_sharp)),
                            label: const Text('Password'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: InkWell(
                  onTap: () async {
                    if (_formSignInKey.currentState!.validate()) {
                       final credential;
                      try {
                        credential = await sl<FirebaseAuth>()
                            .createUserWithEmailAndPassword(
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
                    } else if (!_formSignInKey.currentState!.validate()) {
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffF05984),
                        width: 1,
                      ),
                      color: const Color(0xffF05984),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 311,
                    height: 56,
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
