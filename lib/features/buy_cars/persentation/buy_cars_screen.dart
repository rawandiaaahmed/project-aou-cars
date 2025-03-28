import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/buy_cars/logic/bloc/buy_car_bloc.dart';
import 'package:flutter_application_1/features/buy_cars/logic/bloc/buy_car_event.dart';
import 'package:flutter_application_1/features/buy_cars/logic/bloc/buy_car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buy_detiles_car_screen.dart';
import 'widgets/buy_header.dart';

class BuyCarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuyCarsBloc()..add(LoadBuyCars()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                BuyHeader(),
                SizedBox(height: 12.h),
                BlocBuilder<BuyCarsBloc, BuyCarsState>(
                  builder: (context, state) {
                    if (state is BuyCarsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is BuyCarsLoaded) {
                      final cars = state.cars;
                      return SizedBox(
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
                                    builder: (context) => BuyDetilesCarsScreen(car: car),
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
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 20.sp,
                                              ),

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
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}