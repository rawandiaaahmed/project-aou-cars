import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sell Cars',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.directions_car,
                          color: ColorsManager.mainBlue, size: 24.sp),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Car Details',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Step 3 Of 4',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Next: Personal Details',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Text(
                'Location your address below',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              
            ]
          ),
        )
      )
        );
  }
}