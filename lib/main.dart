import 'package:fall_detection_app/screens/initial/initial_page.dart';
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
      },
      initialRoute: InitialPage.id,
    );
  }
}
