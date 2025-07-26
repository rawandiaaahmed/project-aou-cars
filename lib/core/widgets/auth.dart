import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/auth/persintation/sign_in_screen.dart';
import 'package:flutter_application_1/features/auth/persintation/sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      Container(
        width: double.infinity,
        height: 225.h,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          color: ColorsManager.mainBlue,
        ),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/auth.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/auth.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      Positioned(
          top: 23.h,
          left: 20.w,
          right: 20.w,
          child: Column(children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "CARZATO",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
             SizedBox(height: 140.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignInScreen()),
  );},
                  child:  Text(
                    "Sign in",
                    style:
                        TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
                SizedBox(width: 40.w),
                TextButton(
                  onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignUpScreen()),
  );},
                  child:  Text(
                    "Sign up",
                    style:
                        TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ]))
    ]);
  }
}