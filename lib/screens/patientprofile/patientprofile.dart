import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthStates.dart';

import 'package:flutter/material.dart';
import '../../widgets/patientattendantwidget.dart';
import '../../widgets/patientdetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientInfo extends StatelessWidget {
  static const String id = 'PatientInfo';

  PatientInfo({Key? key, required this.detailID, required this.fallEventID})
      : super(key: key);
  final int detailID;
  final int fallEventID;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ContactFailureState) {
          return Text('error, try later');
        } else if (state is ContactSucessState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0, // Removes the shadow
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
              child: Stack(
                children: [
                  Positioned(
                    left: 140,
                    top: 60,
                    child: Container(
                      width: 104,
                      height: 106,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage("lib/assets/images/patient.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 180,
                    child: Text(
                      state.patientContact.contactName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 60,
                    right: 230,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 17, 30, 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            state.patientContact.userGender,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 200,
                    right: 112,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 17, 30, 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            state.patientContact.userGender,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 300,
                    child: PatientDetail(
                      label: 'Name',
                      value: state.patientContact.contactName,
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 380,
                    child: PatientDetail(
                      label: 'Date of Birth',
                      value: state.patientContact.userDOB,
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 460,
                    child: PatientDetail(
                      label: 'Phone Number',
                      value: state.patientContact.userPhoneNumber,
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 550,
                    child: PatientDetail(
                      label: 'Emergency Contact',
                      value: state.patientContact.emergencyContactPhoneNumber,
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 640,
                    child: Text(
                      'Contact List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 700,
                    left: 26,
                    right: 26,
                    child: Row(
                      children: [
                        Expanded(
                          child: ContactContainer(text: 'Mother'),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ContactContainer(text: 'Friend'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 780,
                    left: 26,
                    right: 26,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 17, 30, 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Edit Details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator(); // Handle loading state
        }
      },
    );
  }
}
