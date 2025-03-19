import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/core/widgets/bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationScreen extends StatelessWidget {
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
              
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Details",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          "Visit Date",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Expect a call shortly from our customer support team",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "5WMC+PWP, As Sabheyyah WA Izbat Sharkas\n"
                      "WA Izbat Raafat, Moharam Bek, Alexandria\n"
                      "Governorate 5412101, Egypt",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 10.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset('assets/images/map.jpeg', height: 100.h, width: double.infinity, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/circle.png', width: 50.w),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Audi A4 2022",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "30,000 - 39,999 KM · Automatic",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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