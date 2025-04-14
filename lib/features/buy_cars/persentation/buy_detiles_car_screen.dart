import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/ai_recommendaion/widgets/header_ai.dart';
import 'package:flutter_application_1/features/bookings/data/models/booking_model.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_bloc.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  BuyDetilesCarsScreen extends StatelessWidget {
  final Map<String, dynamic> car;

   BuyDetilesCarsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderAi(),
              SizedBox(height: 12.h),
              
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: ColorsManager.mainBlue),
                  ),
                  SizedBox(width: 50.w),
                  Text(
                    car['title'],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 12.h),

              Center(
                child: Container(
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                        child: Image.asset(
                          car['iconpath'],
                          height: 160.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            Text(
                              car['title'],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              car['suptitle'],
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            
                            Row(
                              children: [
                                Text(
                                  "City: ${car['City']}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Color: ${car['Color']}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            
                            SizedBox(height: 4.h),

                            Row(
                              children: [
                                Text(
                                  "Model: ${car['Model']}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Make: ${car['make']}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 6.h),

                            Text(
                            car["prise"],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 18.sp),
                                Icon(Icons.star, color: Colors.orange, size: 18.sp),
                                Icon(Icons.star, color: Colors.orange, size: 18.sp),
                                Icon(Icons.star, color: Colors.orange, size: 18.sp),
                                Icon(Icons.star, color: Colors.orange, size: 18.sp),
                              ],
                            )
                          ],
                        ),
                      ),
                          
                    ],
                  ),
                ),
              ),
                SizedBox(height: 20.h),
                      Padding(
                        padding:  EdgeInsets.all(20.w),
                        child: Center(
                          child: ElevatedButton(
                                    onPressed: () {
  final booking = BookingModel(
    carName: car['title'] ?? 'Unknown',
    date: DateTime.now().toString().split(' ')[0],
    status: 'Pending',
    iconpath: car['iconpath'] ?? 'unknown',

  Model: car['Model'] ?? 'Unknown',
    make: car['make'] ?? 'Unknown',
    Color: car['Color'] ?? 'Unknown',
    City: car['City'] ?? 'Unknown',
    prise: car['prise'] ?? 'Unknown',
    suptitle: car['suptitle'] ?? 'Unknown',

    
  );

  context.read<BookingsBloc>().add(AddBookingEvent(booking));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Car booked successfully!')),
  );

  Navigator.pop(context);
},
                                    child: Text(
                                      'Book The Car',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsManager.mainBlue,
                                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 60.w),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
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