import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/ai_recommendaion/show_ai_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttom extends StatelessWidget {
  const Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShowAiScreen()),
  );

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.mainBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            minimumSize: Size(135.w, 42.h)),
        child: Text(
          "Show Me The Car",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
