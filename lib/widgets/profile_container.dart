import 'package:fall_detection_app/helper/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profileContainer extends StatelessWidget {
  const profileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 98,
      padding: const EdgeInsets.only(top: 8, left: 7, right: 9, bottom: 9),
      decoration: ShapeDecoration(
        color: Color(0xFFFDFDFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.37),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x11171A1F),
            blurRadius: 1,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x1E171A1F),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        width: 324,
        height: 81,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.79),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x11171A1F),
              blurRadius: 1,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x1E171A1F),
              blurRadius: 2,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 44,
                ),
                //  SizedBox(width: 44,),
                Text(
                  'Following',
                  style: Styles.TextStyle18,
                ),
                SizedBox(
                  width: 116,
                ),
                Text(
                  '2',
                  style: Styles.TextStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 56,
                ),
                Text(
                  'Patients',
                  style: Styles.TextStyle12,
                ),
                SizedBox(
                  width: 114,
                ),
                Text(
                  'Followers',
                  style: Styles.TextStyle12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
