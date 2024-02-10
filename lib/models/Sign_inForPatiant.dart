import '../helper/api/end_ponits.dart';

class SignInForPatiant{
  final String email;
  final String id;

  SignInForPatiant({required this.email, required this.id});

  factory SignInForPatiant.fromJson(Map<String, dynamic> jsonData) {
    return SignInForPatiant(
      email: jsonData[ApiKey.userEmail],
      id: jsonData[ApiKey.id],
    );
  }
}