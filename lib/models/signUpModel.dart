import '../helper/api/end_ponits.dart';

class SignUpModel {
  final int id;

  SignUpModel({required this.id});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(id: jsonData[ApiKey.id]);
  }
}
