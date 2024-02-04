import 'package:flutter/material.dart';

class PatientDetailAttend extends StatelessWidget {
  final String label;
  final String value;

  const PatientDetailAttend({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5), // Add spacing between label and value
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
