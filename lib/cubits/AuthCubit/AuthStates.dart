

import '../../Models/user_model.dart';

abstract class UserState{}

class SignInLoading extends UserState {}
class UserInitial extends UserState{}
class SignInSuccess extends UserState {}

class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}


class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {
  final int id;

  SignUpSuccess({required this.id});
}

class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}


class UserLoading extends UserState{}
class UserSuccess extends UserState{
  final  UserModel user;

  UserSuccess({required this.user});
}
class Userfailer extends UserState{
  final String errorMessage;

  Userfailer({ required this.errorMessage});


}





class ContactLoadingState extends UserState {}

class ContactSucessState extends UserState {
  final   List<UserModel> patientContact;

  ContactSucessState({required this.patientContact});


}
class ContactFailureState extends UserState {
  final String errormsg;

  ContactFailureState({required this.errormsg});
}

class PatientLoadingSignin extends UserState {}

class PatientSignInSuccess extends UserState {}

class PatientSigninFailure extends UserState {
  final String errmsg;

  PatientSigninFailure({required this.errmsg});
}
