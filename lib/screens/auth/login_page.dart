import 'package:fall_detection_app/constants/constants.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthStates.dart';
import 'package:fall_detection_app/screens/auth/signup_screen.dart';
import 'package:fall_detection_app/screens/homepage/homepage.dart';
import 'package:fall_detection_app/widgets/elevated_button_widget.dart';
import 'package:fall_detection_app/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_feild_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<UserCubit,UserState>(

      listener: (context, state) {


      if (state is SignInSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );

        Navigator.pushNamed(context, homepageView.id);
      }

      else if (state is SignInFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errMessage),
          ),
        );
      }


      },

      builder: (context, state) {
        return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(
              key: context.read<UserCubit>().signInFormKey,
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'LOG IN',
                          style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      //this textfeild for the email
                      TextFormFieldWidget(
                        Controller:  context.read<UserCubit>().signInEmail,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                        text: "Email",
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return ('You must enter your email');
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      //this is for the password
                      TextFormFieldWidget(
                        Controller:  context.read<UserCubit>().signInPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onChanged: (value) {},
                        text: "Password",
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return ('Password must be at least 6 characters');
                          } else {
                            return null;
                          }
                        },
                      ),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButtonWidget(
                          text: 'Forgot Password?',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      state is SignInLoading
                      ? const CircularProgressIndicator():
                      ElevatedButtonWidget(
                        color: AppColors.kPrimaryColor,
                        onPressed: () {

                          if ((context.read<UserCubit>().signInFormKey).currentState!.validate()) {
                            context.read<UserCubit>().SignIn();
                            print('valid');
                          } else {
                            print('not valid');
                          }



                        },
                        text: 'Log in',
                      ),
                      TextButtonWidget(
                        text: 'Need an account?Sign up',
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
