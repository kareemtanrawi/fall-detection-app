import 'package:fall_detection_app/constants/constants.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthStates.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/widgets/elevated_button_widget.dart';
import 'package:fall_detection_app/widgets/text_button_widget.dart';
import 'package:fall_detection_app/widgets/text_feild_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/register_container.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static const String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Success"),
            ));
            Navigator.pushNamed(context, homepageView.id);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  RegisterContainer(size: size),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: context.read<UserCubit>().signUpFormKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            //this textfeild for the email
                            TextFormFieldWidget(
                              Controller: context.read<UserCubit>().signUpEmail,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains('@') ||
                                    !value.contains('.')) {
                                  return ('You must enter your email');
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              text: "Email",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //this textfeild for the password
                            TextFormFieldWidget(
                              Controller:
                                  context.read<UserCubit>().signUpPassword,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return ('You must enter your password');
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              text: "Password",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //this textfeild for the name
                            TextFormFieldWidget(
                              Controller: context.read<UserCubit>().signUpName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('You must enter your name');
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.name,
                              text: "Name",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //this textfeild for the gender
                            TextFormFieldWidget(
                              Controller:
                                  context.read<UserCubit>().signUpGender,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('You must enter your gender');
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              text: "Gender",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //this textfeild for the phone
                            TextFormFieldWidget(
                              Controller:
                                  context.read<UserCubit>().signUpPhoneNumber,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 11) {
                                  return ('You must enter your phone');
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              text: "Phone",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            state is SignUpLoading
                                ? CircularProgressIndicator()
                                : TextButtonWidget(
                                    text: "Get Started",
                                    onPressed: () {
                                      if ((context
                                              .read<UserCubit>()
                                              .signUpFormKey)
                                          .currentState!
                                          .validate()) {
                                        print('valid');
                                        context.read<UserCubit>().signUp();
                                      } else {
                                        print('not valid');
                                      }
                                    },
                                  ),
                            SizedBox(
                              height: size.height * 0.3,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
