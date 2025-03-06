import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/auth.dart';
import 'package:flutter_application_1/core/widgets/bottom_bar.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';
import 'package:flutter_application_1/features/auth/persintation/forget_password_screen.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formkey = GlobalKey<FormState>();

  final email = TextEditingController();

  final password = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(authRepository: AuthRepository()),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSucces) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => BottomBar()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }, builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Auth(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0.h),
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
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(5.0.h),
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
                                    padding:  EdgeInsets.all(5.0.h),
                                    child: TextFormField(
                                      controller: password,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 7) {
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
                            SizedBox(
                              height: 5.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen()),
                                  );
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.mainBlue,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 50.h),
                              ),
                              onPressed: () {
                                formkey.currentState!.save();
                                if (formkey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignInEvent(
                                      email: email.text,
                                      password: password.text,
                                      
                                    
                                      ));
                                }
                              },
                              child: state is AuthLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Sign in",
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
            ),
          );
        }));
  }
}
