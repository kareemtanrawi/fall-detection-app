// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class EmergencyContact {
  final int userId;
  final String contactName;
  final String contactPhoneNumber;
  final String contactEmail;
  final String relationship;

  EmergencyContact({
    required this.userId,
    required this.contactName,
    required this.contactPhoneNumber,
    required this.contactEmail,
    required this.relationship,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      userId: json['userId'],
      contactName: json['contactName'],
      contactPhoneNumber: json['contactPhoneNumber'],
      contactEmail: json['contactEmail'],
      relationship: json['relationship'],
    );
  }
}
