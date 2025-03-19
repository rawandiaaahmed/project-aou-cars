import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/sell_cars/persentation/location_screen.dart';

import 'package:flutter_application_1/features/sell_cars/persentation/widgets/text_field_sell_car.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetalisScreen extends StatelessWidget {
  const CarDetalisScreen({super.key});

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
                            'Step 2 Of 4',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Next: Location',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Text(
                'Fill your car details',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

            
              TextFieldSellCar(label: 'Make', hint: 'What is your car make?'),
              TextFieldSellCar(label: 'Model', hint: 'Pick your car model'),
              TextFieldSellCar(label: 'Year', hint: 'What is your car year?'),
              TextFieldSellCar(
                  label: 'Kilometers', hint: 'What is your kilometrage range?'),
              TextFieldSellCar(label: 'Transmission', hint: 'Transmission'),

              SizedBox(height: 30.h),

          
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
                  onPressed: () {
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LocationScreen()),
  );
                   
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
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
