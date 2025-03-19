import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/auth.dart';
import 'package:flutter_application_1/core/widgets/bottom_bar.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formkey = GlobalKey<FormState>();

  final email = TextEditingController();

  final password = TextEditingController();
  final phoneNember = TextEditingController();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final name = TextEditingController();
  

  bool islouding = false;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(authRepository: AuthRepository()),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSucces) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("sign up Successful")));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }, builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
            child: Column(
              children: [
                Auth(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:  EdgeInsets.all(6.0.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Form(
                            key: formkey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(4.h),
                                  child: TextFormField(
                                    controller: firstName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter a vaild name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorsManager.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        hintText: 'First Name',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(4.0.h),
                                  child: TextFormField(
                                    controller: lastName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter a vaild name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color:ColorsManager.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        hintText: 'Last Name',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(4.0.h),
                                  child: TextFormField(
                                    controller: phoneNember,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter a vaild phone number';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorsManager.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        hintText: 'phone Number',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(4.0.h),
                                  child: TextFormField(
                                    controller: email,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'please enter a vaild email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorsManager.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        hintText: 'email',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.h),
                                  child: TextFormField(
                                    controller: password,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return 'please enter a vaild password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          borderSide:
                                              BorderSide(color: ColorsManager.mainBlue),
                                        ),
                                        hintText: 'password',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.mainBlue,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 50.h),
                            ),
                            onPressed: () {
                              formkey.currentState!.save();
                              if (formkey.currentState!.validate()) {
                                context.read<AuthBloc>().add(SignUpEvent(
                                    email: email.text,
                                    firstname: firstName.text,
                                    lastname: lastName.text,
                                    password: password.text,
                                    phonenumber: phoneNember.text,
                                   
                                    ));
                              }
                            },
                            child: state is AuthLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Sign up",
                                    style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )));
        }));
  }
}
