// import '..\..\constants\constants.dart';
// import 'package:fall_detection_app/widgets/container_widget.dart';
import 'package:fall_detection_app/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});
  static String id = 'InitialPage';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  container_widget(size: size),
                  const SizedBox(
                    width: 4,
                  ),
                  container_widget(size: size),
                  const SizedBox(
                    width: 4,
                  ),
                  container_widget(size: size),
                  const SizedBox(
                    width: 4,
                  ),
                  container_widget(size: size),
                ],
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              Center(
                child:
                    Image.asset('assets/images/home_screen.png', height: 200),
              ),
              const SizedBox(
                height: 56,
              ),
              Text(
                'Welcome To FullGuard! Lets Get Started.',
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'FallGuard is the ultimate app for elders and caregivers. Download now and experience peace of mind.',
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButtonWidget(
                color: AppColors.kPrimaryColor,
                onPressed: () {
                  // print('pressed');
                },
                text: "Next",
              ),
              const SizedBox(
                height: 12,
              ),
              text_button_widget(
                text: 'Skip',
                onPressed: () {},
              ),
              const SizedBox(
                height: 51,
              ),
              text_button_widget(
                text: 'Sign in now',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
