import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
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
          top: 35.h,
          left: 15.w,
          right: 15.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CARZATO",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'AI Recommendations?',
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 38.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                          "Welcome Back rawan",
                          style: TextStyle(color: Colors.white),
                        )
                ]
                  ),
                ],
              ),
            
          ),
        
      ],
    );
  }
}