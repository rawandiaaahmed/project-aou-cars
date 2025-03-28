import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/buy_cars/persentation/buy_cars_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyCar extends StatefulWidget {
  BuyCar({super.key});

  @override
  State<BuyCar> createState() => _BuyCarState();
}

class _BuyCarState extends State<BuyCar> {
  final List<Map<String, dynamic>> catgeriess = [
    {
      'iconpath': 'assets/images/cccaaarrr.jpeg',
      'title': 'Kia Spectra 2002',
      'suptitle': 'Automatic • 82,500 Km',
      'prise': '1,500,000 EGP'
    },
    {
      'iconpath': 'assets/images/carrs.jpeg',
      'title': 'Nissan Sunny 2021',
      'suptitle': 'Automatic • 83,500 Km',
      'prise': '2,500,000 EGP'
    },
    {
      'iconpath': 'assets/images/car2.jpeg',
      'title': 'Toyota Corolla 2021',
      'suptitle': 'Automatic • 88,500 Km',
      'prise': '1,700,000 EGP'
    },
    {
      'iconpath': 'assets/images/cars.jpeg',
      'title': 'Nissan Sunny 2022',
      'suptitle': 'Automatic • 89,500 Km',
      'prise': '1,600,000 EGP'
    },
    {
      'iconpath': 'assets/images/carrs.jpeg',
      'title': 'Kia Spectra 2002',
      'suptitle': 'Automatic • 82,500 Km',
      'prise': '1,500,000 EGP'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyCarsScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Buy your car',
                      style: TextStyle(
                          color: ColorsManager.mainBlue, fontSize: 13.sp),
                    ),
                  ],
                )),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 200.h,
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemCount: catgeriess.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160.w,
                      height: 160.h,
                      margin: EdgeInsets.only(right: 17.w, bottom: 20),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            catgeriess[index]['iconpath'],
                            width: 120.w,
                            height: 100.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            catgeriess[index]['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            catgeriess[index]['suptitle'],
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            catgeriess[index]['prise'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
