// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously
import 'package:dashbord_cafe/config/bloc_integration.dart';
import 'package:dashbord_cafe/config/di.dart';
import 'package:dashbord_cafe/config/theme/bloc/theme_app_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/pages/user_pages/base_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashbord_cafe/injection_container.dart';

import 'features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_event.dart';
import 'features/place_of_study/presentation/pages/first_pages/walkthroght_pages.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setup();
  await initializeDependencies();

  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider<ThemeAppBloc>(
    create: (context) => sl<ThemeAppBloc>()..add(SetInitialThemeApp()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlaceOfCafesBloc>(
          create: (context) => sl<PlaceOfCafesBloc>()..add(const GetPlaces()),
        ),
      ],
      child: BlocBuilder<ThemeAppBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, theme: state,
            // home: Artbord1(),
            home: (sl<FirebaseAuth>().currentUser != null)
                ? Basepage()
                : PagesWalkthroght(),
          );
        },
      ),
    );
  }
}
