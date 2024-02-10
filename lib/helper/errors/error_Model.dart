



import '../api/end_ponits.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(dynamic jsonData) {
    return ErrorModel(
      status: 500,
      errorMessage: jsonData,
    );
  }
}
