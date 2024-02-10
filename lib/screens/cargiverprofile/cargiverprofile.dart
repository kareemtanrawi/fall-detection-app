import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthStates.dart';
import 'package:fall_detection_app/helper/Styles.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/screens/map/map.dart';
import 'package:fall_detection_app/screens/notifications/notifications.dart';
import 'package:fall_detection_app/widgets/customAppbar.dart';
import 'package:fall_detection_app/widgets/profile_container.dart';
import 'package:fall_detection_app/widgets/profleAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cargiverprofile extends StatelessWidget {
  const Cargiverprofile({Key? key}) : super(key: key);
  static const String id = 'CargiverProfile';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, homepageView.id);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        title: Text('Profile'),
        titleTextStyle: Styles.TextStyle16,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.person_solid),
            color: Colors.blueGrey,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 21,
            ),
            //ProfileAppBar(),
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
                      "Jone",
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
                            "+23456789765",
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
            ),

            SizedBox(
              height: 35,
            ),
            profileContainer(),

            SizedBox(
              height: 39,
            ),
            Text(
              'Total Assistance',
              style: Styles.TextStyle12,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 340,
              height: 59,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
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
              child: Row(
                children: [
                  SizedBox(
                    width: 19,
                  ),
                  Icon(Icons.check),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Aids',
                    style: Styles.TextStyle16,
                  ),
                  SizedBox(
                    width: 195,
                  ),
                  Text(
                    '3',
                    style: Styles.TextStyle16,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Expanded(
          child: SizedBox(
            height: 70,
            width: size.width * 0.1,
            child: BottomAppBar(
              // notchMargin: 5.0,
              // shape: CircularNotchedRectangle(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, homepageView.id);
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                        //   size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, top: 10.0, bottom: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      },
                      icon: Icon(
                        FontAwesomeIcons.solidMap,
                        color: Colors.black,
                        //  size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, bottom: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Notifications.id);
                      },
                      icon: Icon(
                        Icons.notifications_active,
                        color: Colors.black,
                        //   size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        //   context.read<UserCubit>().getUserProfile();
                        Navigator.pushNamed(context, Cargiverprofile.id);
                      },
                      icon: Icon(
                        CupertinoIcons.person_solid,
                        color: Colors.black,
                        // size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
