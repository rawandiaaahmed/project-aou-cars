import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/auth.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSucces) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password reset email sent! Check your inbox.")),
            );
            Navigator.pop(context); 
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
             
              body: Column(
                children: [
                  Auth(),
                  Padding(
                    padding:  EdgeInsets.all(14.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        
                        children: [
                          SizedBox(height: 15.h,),
                          Text(
                            "Enter your email to receive a password reset link.",
                            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: ColorsManager.mainBlue),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          TextFormField(
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
                                
                          SizedBox(height: 14.h),
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.mainBlue,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 45.h),
                              ),
                            
                            onPressed:

                             state is AuthLoading
                                ? null
                                : () {
                  
  
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                            ResetPasswordEvent(email: email.text.trim()),
                                          );
                                    }
                                  },
                            child: state is AuthLoading
                                ? CircularProgressIndicator()
                                : Text("Send Reset Link", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}