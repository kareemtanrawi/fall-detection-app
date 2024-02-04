import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/widgets/notification_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../cargiverprofile/cargiverprofile.dart';
import '../screens/cargiverprofile/cargiverprofile.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);
  static String id = 'notification';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.white,
        elevation: 0.2,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, homepageView.id);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w700,
            height: 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            NotificationContainer(
              icon: FontAwesomeIcons.solidHeart,
              text: '& 10 others liked your post',
              name: 'Jane',
              Image: 'assets/images/patient.png',
            )
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
              color: Color(0xffFFFFFF),
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
                      onPressed: () {},
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
