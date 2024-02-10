import 'package:dio/dio.dart';
import 'package:fall_detection_app/screens/auth/login_page.dart';
import 'package:fall_detection_app/screens/auth/signup_screen.dart';
import 'package:fall_detection_app/screens/cargiverprofile/cargiverprofile.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/screens/initial/initial_page.dart';
import 'package:fall_detection_app/screens/map/map.dart';
import 'package:fall_detection_app/screens/notifications/notifications.dart';
import 'package:fall_detection_app/screens/patientprofile/patientprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cache/cache_helper.dart';
import 'cubits/AuthCubit/AuthCubit.dart';
import 'helper/api/dio_consumer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const FallDetectionApp(),
    ),
  );
}

class FallDetectionApp extends StatelessWidget {
  const FallDetectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        InitialPage.id: (context) => const InitialPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: ((context) => RegisterPage()),
        Cargiverprofile.id: ((context) => Cargiverprofile()),
        homepageView.id: ((context) => homepageView()),
        Notifications.id: ((context) => Notifications()),
        MapPage.id: ((context) => MapPage()),
        PatientInfo.id: ((context) => PatientInfo()),
      },
      initialRoute: InitialPage.id,
    );
  }
}
