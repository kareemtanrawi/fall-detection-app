import 'package:flutter/material.dart';
//import 'package:tessst/customwidget.dart';
// import 'package:tessst/pateintdetails.dart';

// import '../../widgets/patientattendantwidget.dart';
import '../../widgets/contact_number.dart';
import '../../widgets/patientdetails.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes the shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
            const Positioned(
              left: 140,
              top: 180,
              child: Text(
                'John Doe',
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
                child: const Column(
                  children: [
                    Text(
                      "Gender",
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
                padding: const EdgeInsets.fromLTRB(20, 17, 30, 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    Text(
                      'gender',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 26,
              top: 300,
              child: PatientDetail(label: 'Name', value: 'jol'),
            ),
            const Positioned(
              left: 26,
              top: 380,
              child: PatientDetail(label: 'Date of Birth', value: '01/01'),
            ),
            const Positioned(
              left: 26,
              top: 460,
              child: PatientDetail(label: 'Phone Number', value: '+1 123-'),
            ),
            const Positioned(
              left: 26,
              top: 550,
              child: PatientDetail(
                  label: 'Emergency Contact', value: '+ 987-654-'),
            ),
            const Positioned(
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
            const Positioned(
              top: 700,
              left: 26,
              right: 26,
              child: Row(
                children: [
                  Expanded(
                    child: ContactContainer(text: 'Mother'),
                  ),
                  const SizedBox(width: 20),
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
                padding: const EdgeInsets.fromLTRB(20, 17, 30, 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
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
  }
}
