import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/auth.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

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
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "Enter your email to receive a password reset link.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(labelText: "Email"),
                            validator: (value) {
                              if (value == null || !value.contains("@")) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.mainBlue,
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 60),
                              ),
                            
                            onPressed:

                             state is AuthLoading
                                ? null
                                : () {
                  
  
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                            ResetPasswordEvent(email: emailController.text.trim()),
                                          );
                                    }
                                  },
                            child: state is AuthLoading
                                ? CircularProgressIndicator()
                                : Text("Send Reset Link",style: TextStyle(color: Colors.white),),
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