import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/sell_cars/persentation/sell_cars_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellCar extends StatelessWidget {
  const SellCar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     
      SizedBox(
        height: 145.h,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                
                
              ),
              child: SizedBox(
                height: 270.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sell Your Car, Get Your Price!",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    
                    Row(
                      children: [
                        _buildCheckItem("Instant Offer & Payment"),
                        
                      ],
                    ),
                    _buildCheckItem("No Hidden Costs!"),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.mainBlue),
                      onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SellCarsScreen()),
  );},
                      child:
                          Text("Sell Your Car", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              
            ),
            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(1.r),
              child: Image.asset('assets/images/sell car2.jpeg',fit: BoxFit.cover,width: 120.w,height: 100.h,)))
          ],
            
            ),
      );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: ColorsManager.mainBlue, size: 12.w),
        SizedBox(width: 5.w),
        Text(text, style: TextStyle(fontSize: 14.sp)),
      ],
    );
    
  }
  }