import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/buy_cars/persentation/widgets/buy_header.dart';
import 'package:flutter_application_1/features/sell_cars/persentation/car_detalis_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellCarsScreen extends StatelessWidget {
  const SellCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BuyHeader(),
              SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
                          child: Image.asset(
                            'assets/images/sell_carsa.png', 
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: 180.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                          child: Column(
                            children: [
                              Text(
                                'Sell Your Car, Get Your Price!',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Icon(Icons.check_circle, color: ColorsManager.mainBlue, size: 20.sp),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Instant Offer & Payment',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Icon(Icons.check_circle, color: ColorsManager.mainBlue, size: 20.sp),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'No Hidden Costs!',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsManager.mainBlue,
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CarDetalisScreen()),
  );},
                                  child: Text(
                                    'Get Your Price  >',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
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

                
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Text(
                    'Next Step ( Car and personal details )',
                    style: TextStyle(fontSize: 14.sp, color: ColorsManager.mainBlue,fontWeight: FontWeight.bold),
                  ),
                ),
              
            ]
          )
          )
            
          )
          );
  }
}