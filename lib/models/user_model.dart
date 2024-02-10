class UserModel {
  final String userName;
  final String userEmail;
  final String password;
  final String userDOB;
  final String userGender;
  final String userPhoneNumber;
  final String photo;
  final String country;
  final String emergencyContactName;
  final String emergencyContactPhoneNumber;
  final String contactName;
  final String contactPhoneNumber;
  final String contactPhoto;
  final int userID;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.password,
    required this.userDOB,
    required this.userGender,
    required this.userPhoneNumber,
    required this.photo,
    required this.country,
    required this.emergencyContactName,
    required this.emergencyContactPhoneNumber,
    required this.contactName,
    required this.contactPhoneNumber,
    required this.contactPhoto,
    required this.userID


  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName']??'',
      userEmail: json['userEmail']??'',
      password: json['password']??'',
      userDOB: json['userDOB']??'',
      userGender: json['userGender']??'',
      userPhoneNumber: json['userPhoneNumber']??'',
      photo: json['photo']??'',
      country: json['country']??'',
      emergencyContactName: json['emergencyContactName']??'',
      emergencyContactPhoneNumber: json['emergencyContactPhoneNumber']??'',
      contactName: json['contactName']??'',
      contactPhoneNumber: json['contactPhoneNumber']??'',
      contactPhoto: json['contactPhoto']??'',
      userID: json['userID']??0,
    );
  }
}
