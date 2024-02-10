import 'package:fall_detection_app/constants/constants.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/helper/Styles.dart';
import 'package:fall_detection_app/screens/cargiverprofile/cargiverprofile.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/screens/map/map.dart';
import 'package:fall_detection_app/screens/notifications/notifications.dart';
import 'package:fall_detection_app/widgets/patiantdetailsListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'PatiantsListView.dart';
import 'customAppbar.dart';

class HomepageViewBody extends StatelessWidget {
  const HomepageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        leadingWidth: 10,
        title: Text('Homepage'),
        titleTextStyle: Styles.TextStyle18,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //customAppbar(),
            SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: PatiantsListView(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: size.height * 20,
              //width: size.width*40,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: DetailesListView(),
                  );
                },
              ),
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
              //   notchMargin: 5.0,
              //shape: CircularNotchedRectangle(),
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
                        // context.read<UserCubit>().getUserProfile();
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
