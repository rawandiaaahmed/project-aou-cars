import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/auth/persintation/sign_in_screen.dart';
import 'package:flutter_application_1/features/splash/logic/bloc/splash_bloc.dart';
import 'package:flutter_application_1/features/splash/logic/bloc/splash_event.dart';
import 'package:flutter_application_1/features/splash/logic/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is splashFinished) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          }
        },
        child: SafeArea(
          child: Scaffold(
           
            body: Stack(
              children: [
                
               Container(
                    width: double.infinity,
                    height: double.infinity,
                     decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: ColorsManager.mainBlue,
        ),
         child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/auth.png',
            fit: BoxFit.fitHeight,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            
          ],
        ),
                  ),
                
          
              
                Positioned(
                  top: 266.h,
                  left: 30.w,
                  right: 30.w,
              
                  
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    
                        Column(
                          children: [
                            Text(
                              "CARZATO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 41.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationX(3.1416.r),
                              child: Opacity(
                                opacity: 0.3,
                                child: Text(
                                  "CARZATO",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 41.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                            
                        SizedBox(height: 250.h), 
                            
                      
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(top:40.h),
                            child: Text(
                              "Upgrade Your Car!",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      )
      
    );
  }
}