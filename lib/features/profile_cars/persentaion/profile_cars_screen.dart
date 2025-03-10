import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/profile_cars/persentaion/widgets/car_profile.dart';
import 'package:flutter_application_1/features/profile_cars/persentaion/widgets/header_profile.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCarsScreen extends StatelessWidget {
  const ProfileCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderProfile(),
            
              SizedBox(height: 16.h),
               CarProfile(title: "My Bookings", icon:  Icons.calendar_today),
              CarProfile(title: "Why Carzato",icon:  Icons.article_outlined),
              CarProfile(title: "Logout",icon:  Icons.logout),

            ]
          )
        )
      )
          );
  }
}