import 'package:fall_detection_app/helper/Styles.dart';
import 'package:fall_detection_app/widgets/customAppbar.dart';
import 'package:fall_detection_app/widgets/profleAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cargiverprofile extends StatelessWidget {
  const Cargiverprofile({Key? key}) : super(key: key);
  static String id = 'CargiverProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 21,
              ),
              ProfileAppBar(),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 89,
                height: 89,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/caregiver.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135,
                  ),
                  Column(
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Color(0xFF171A1F),
                          fontSize: 24,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w900,
                          height: 0.06,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                )),
                            Text(
                              '123-456-7890',
                              style: Styles.TextStyle12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 47,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 46,
                      height: 45,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/chat.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
