import '../helper/api/end_ponits.dart';

class SignInModel {


  final int emergencyContactID;
  final int userID;
  final String contactName;
  final String contactPhoneNumber;
  final String contactEmail;
  final String contactPassword;
  final String gender;
  final String contactPhoto;
  final String relationship;
  final dynamic user;

  SignInModel({
    required this.emergencyContactID,
    required this.userID,
    required this.contactName,
    required this.contactPhoneNumber,
    required this.contactEmail,
    required this.contactPassword,
    required this.gender,
    required this.contactPhoto,
    required this.relationship,
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      emergencyContactID: jsonData['emergencyContactID'] ?? 0,
      userID: jsonData['userID'] ?? 0,
      contactName: jsonData['contactName'] ?? '',
      contactPhoneNumber: jsonData['contactPhoneNumber'] ?? '',
      contactEmail: jsonData['contactEmail'] ?? '',
      contactPassword: jsonData['contactPassword'] ?? '',
      gender: jsonData['gender'] ?? '',
      contactPhoto: jsonData['contactPhoto'] ?? '',
      relationship: jsonData['relationship'] ?? '',
      user: jsonData['user'],
    );
  }

}


/*
*   final String email;
  final String id;

  SignInModel({required this.email, required this.id});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      email: jsonData[ApiKey.userEmail],
      id: jsonData[ApiKey.id],
    );
  }
*
*
* */