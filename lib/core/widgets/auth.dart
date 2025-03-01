import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        height: 260,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
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
          top: 33,
          left: 20,
          right: 20,
          child: Column(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "CARZATO",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignInScreen()),
  );},
                  child: const Text(
                    "Sign in",
                    style:
                        TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 40),
                TextButton(
                  onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignUpScreen()),
  );},
                  child: const Text(
                    "Sign up",
                    style:
                        TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ],
            ),
          ]))
    ]);
  }
}