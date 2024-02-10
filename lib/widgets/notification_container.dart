import 'package:fall_detection_app/helper/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({Key? key, required this.name, required this.icon, required this.text, required this.Image}) : super(key: key);
final String name;
final IconData icon;
final String text;
final String Image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349,
      height: 58,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x11171A1F),
            blurRadius: 1,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),BoxShadow(
            color: Color(0x1E171A1F),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 14,),
          Icon(icon,color: Colors.black87,),
          SizedBox(width: 5,),
          Text('$name',style: Styles.TextStyle12,),
          SizedBox(width: 10,),
          Text('$text',style: Styles.TextStyle12,),
          SizedBox(width: 64,),
          Container(
            width: 46,
            height: 46,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('$Image'),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
            ),
          )

        ],
      ),
    );
  }
}
