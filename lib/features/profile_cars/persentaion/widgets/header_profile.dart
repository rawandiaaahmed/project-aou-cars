import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/ai_recommendaion/ai_recommendaion_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';

class HeaderProfile extends StatelessWidget {
  final String firstname;
  final String phonenumber;

  const HeaderProfile({super.key, required this.firstname, required this.phonenumber});

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
        ),
        Positioned(
          top: 35.h,
          left: 15.w,
          right: 15.w,
          child: Column(
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
                        onTap: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AiRecommendaionScreen()),
                    );
                        },
                        child: Text(
                          'AI Recommendations?',
                          style: TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
              ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      radius: 16.r,
                      child: Text(
                        firstname.isNotEmpty ? firstname[0].toUpperCase() : "?",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstname,
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          phonenumber,
                          style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}