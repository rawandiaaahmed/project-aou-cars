import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConfirmationScreen extends StatefulWidget {
  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Image.asset('assets/images/sell car2.jpeg', height: 150.h),
              SizedBox(height: 16.h),
              Text(
                "We received your selling request and will get back to you as soon as possible!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Carzato customer support will contact you to arrange an inspection visit to your location",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              
           

              SizedBox(height: 30.h),

              ElevatedButton(
                onPressed: () {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>BottomBar()),
  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Home Page",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}