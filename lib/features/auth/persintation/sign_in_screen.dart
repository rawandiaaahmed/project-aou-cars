import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/auth.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';
import 'package:flutter_application_1/features/auth/persintation/forget_password_screen.dart';

import 'package:flutter_application_1/features/home/persintation/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.all(5.0),
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
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: 'email',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
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
                                                BorderRadius.circular(12),
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          hintText: 'password',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )),
                                    ),
                                  ),
                                 
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ForgetPasswordScreen(rm)),
  );
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.mainBlue,
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 60),
                              ),
                              onPressed: () {
                                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Home()),
  );
                                formkey.currentState!.save();
                                if (formkey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignInEvent(
                                      email: email.text, password: password.text));
                                }
                              },
                              child: state is AuthLoading?CircularProgressIndicator() : Text(
                                "Sign in",
                                style: TextStyle(color: Colors.white),
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
        }
        )
        );
  }
}
