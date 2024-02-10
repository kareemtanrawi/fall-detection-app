import 'package:bloc/bloc.dart';
import 'package:fall_detection_app/Models/Sign_inForPatiant.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

import '../../Models/signUpModel.dart';

import '../../Models/signin_model.dart';

import '../../Models/user_model.dart';
import '../../cache/cache_helper.dart';
import '../../helper/api/api_consumer.dart';
import '../../helper/api/end_ponits.dart';
import '../../helper/errors/failures.dart';
import 'AuthStates.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  TextEditingController signUpGender = TextEditingController();

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        //isFromData: true,
        data: {
          ApiKey.contactName: signUpName.text,
          ApiKey.contactPhoneNumber: signUpPhoneNumber.text,
          ApiKey.contactEmail: signUpEmail.text,
          ApiKey.contactPassword: signUpPassword.text,
          ApiKey.gender: signUpGender.text,
          ApiKey.relationship: "",
          ApiKey.contactPhoto: "",
          ApiKey.userID: 53,
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(id: signUPModel.id));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  /* signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.contactEmail: signInEmail.text,
          ApiKey.contactPassword: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      //final decodedToken = JwtDecoder.decode(user!.token);
     // CacheHelper().saveData(key: ApiKey.id, value: user!.id);
     // CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }
*/

  SignInModel? user;

  getUserProfile() async {
    try {
      emit(UserLoading());
      final id = CacheHelper().getData(key: ApiKey.emergencyContactID);
      final response =
          await api.get(EndPoint.getUserData, queryParameters: {'id': id});

      emit(UserSuccess(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(Userfailer(errorMessage: e.errModel.errorMessage));
    }
  }

  // signIn userr;
  SignIn() async {
    try {
      emit(SignInLoading());

      final response = await api.get(
        '${EndPoint.caregiverByEmail}?Email=${signInEmail.text}',
      );

      user = SignInModel.fromJson(response);

      CacheHelper().saveData(
          key: ApiKey.emergencyContactID, value: user!.emergencyContactID);

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  getPatientcontact(id) async {
    try {
      emit(ContactLoadingState());
      final response = await api.get(EndPoint.getPatientData, queryParameters: {
        ApiKey.id: id,
      });

      emit(ContactSucessState(
        patientContact: UserModel.fromJson(response),
      ));
    } on ServerException catch (e) {
      emit(ContactFailureState(errormsg: e.errModel.errorMessage));
    }
  }

  SignInForPatiant? patient;
  PatientSigninignIn() async {
    try {
      emit(PatientLoadingSignin());
      final response = await api.get(
        EndPoint.PatientSignin,
        queryParameters: {
          ApiKey.userEmail: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      patient = SignInForPatiant.fromJson(response);
      //final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: patient!.id);
      // CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(PatientSignInSuccess());
    } on ServerException catch (e) {
      emit(PatientSigninFailure(errmsg: e.errModel.errorMessage));
    }
  }
}
