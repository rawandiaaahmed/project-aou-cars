import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/ai_recommendaion/ai_detals_cars_screen.dart';

import 'package:flutter_application_1/features/ai_recommendaion/widgets/header_ai.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAiScreen extends StatelessWidget {
  ShowAiScreen({super.key});

  final List<Map<String, dynamic>> cars = [
    {
      'iconpath': 'assets/images/car2.jpeg',
      'title': 'Toyota Corolla 2021',
      'suptitle': 'Automatic • 88,500 Km',
      'prise': '1,700,000 EGP',
      'Color': 'Brown',
      'City': 'Giza',
      'Model': 'Sportage',
      'make': 'Kia',
    },
    {
      'iconpath': 'assets/images/cars.jpeg',
      'title': 'Nissan Sunny 2022',
      'suptitle': 'Automatic • 89,500 Km',
      'prise': '1,600,000 EGP',
      'Color': 'Brown',
      'City': 'Giza',
      'Model': 'Sportage',
      'make': 'Kia',
    },
    {
      'iconpath': 'assets/images/carrs.jpeg',
      'title': 'Kia Spectra 2002',
      'suptitle': 'Automatic • 82,500 Km',
      'prise': '1,500,000 EGP',
      'Color': 'Black',
      'City': 'Alexandria',
      'Model': 'Sportage',
      'make': 'Kia',
    },
    {
      'iconpath': 'assets/images/carrrs.avif',
      'title': 'BMW X1 2018',
      'suptitle': 'Automatic • 89,500 Km',
      'prise': '2,500,000 EGP',
      'Color': 'Silver',
      'City': 'Giza',
      'Model': 'Sportage',
      'make': 'Kia',
    },
    {
      'iconpath': 'assets/images/ccaarrss.jpeg',
      'title': 'BMW X1 2018',
      'suptitle': 'Automatic • 89,500 Km',
      'prise': '3,500,000 EGP',
      'Color': 'Red',
      'City': 'Alexandria',
      'Model': 'Sportage',
      'make': 'Kia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              
              HeaderAi(),
              SizedBox(height: 12.h),
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final car = cars[index];

                    return InkWell(
                      onTap: () {
                       Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<BookingsBloc>(context),
      child: AiDetalsCarsScreen(car: car),
    ),
  ),
);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8.r,
                              spreadRadius: 2.r,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                car["iconpath"],
                                width: 100.w,
                                height: 70.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    car["title"],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    car["suptitle"],
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        car["prise"],
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green
                                        ),
                                      ),
                                      Icon(Icons.star,color: Colors.orange,size: 20.sp, )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}