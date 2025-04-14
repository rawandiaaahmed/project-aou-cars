import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/bookings/data/models/booking_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingItem extends StatelessWidget {
  final BookingModel booking;

  const BookingItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        booking.carName,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.mainBlue,
        ),
      ),

      SizedBox(height: 4.h),
      Text(booking.date, style: TextStyle(fontSize: 14.sp)),
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
                  booking.iconpath,
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
                      booking.carName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      booking.suptitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          booking.City,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          booking.Color,
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
                          booking.Model,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          booking.make,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      booking.prise,
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
      SizedBox(height: 15.h),
    ]);
  }
}
