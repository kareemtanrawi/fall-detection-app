import 'package:fall_detection_app/helper/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            width: 170,
          ),
          Text(
            'Profile',
            style: Styles.TextStyle16,
          ),
          SizedBox(
            width: 123,
          ),
          Icon(
            CupertinoIcons.person_solid,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
