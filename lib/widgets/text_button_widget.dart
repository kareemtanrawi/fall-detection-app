import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text_button_widget extends StatelessWidget {
  text_button_widget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.aBeeZee(
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
