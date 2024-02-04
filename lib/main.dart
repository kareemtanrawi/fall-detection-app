import 'package:fall_detection_app/screens/auth/login_page.dart';
import 'package:fall_detection_app/screens/auth/signup_screen.dart';
import 'package:fall_detection_app/screens/cargiverprofile/cargiverprofile.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/screens/initial/initial_page.dart';
import 'package:fall_detection_app/screens/map/map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FallDetectionApp());
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
        Cargiverprofile.id: ((context) => const Cargiverprofile()),
        homepageView.id: ((context) => const homepageView()),
        MapPage.id: ((context) => MapPage()),
      },
      initialRoute: InitialPage.id,
    );
  }
}
