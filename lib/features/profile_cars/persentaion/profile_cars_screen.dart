import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/persintation/sign_in_screen.dart';
import 'package:flutter_application_1/features/bookings/data/repository/booking_repository.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_bloc.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_event.dart';
import 'package:flutter_application_1/features/bookings/presentation/mybooking_screen.dart';
import 'package:flutter_application_1/features/profile_cars/data/repository/profile_repository.dart';
import 'package:flutter_application_1/features/profile_cars/logic/bloc/profile_bloc.dart';
import 'package:flutter_application_1/features/profile_cars/logic/bloc/profile_event.dart';
import 'package:flutter_application_1/features/profile_cars/logic/bloc/profile_state.dart';
import 'package:flutter_application_1/features/profile_cars/persentaion/widgets/car_profile.dart';
import 'package:flutter_application_1/features/profile_cars/persentaion/widgets/header_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProfileCarsScreen extends StatelessWidget {
  const ProfileCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(profileRepository: ProfileRepository())..add(LoadProfile()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProfileLoaded) {
                      return HeaderProfile(
                        firstname: state.firstname,
                        phonenumber: state.phonenumber,
                      );
                    } else {
                      return const HeaderProfile(
                        firstname: "Unknown",
                        phonenumber: "No Phone",
                      );
                    }
                  },
                ),
                SizedBox(height: 16.h),

                /// الزرار الخاص بالحجوزات
                CarProfile(
                  title: "My Bookings",
                  icon: Icons.calendar_today,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
  create: (_) => BookingsBloc(bookingsRepository: BookingsRepository())..add(LoadBookingsEvent()),
  child: const MyBookingsScreen(),
),
                      ),
                    );
                  },
                ),

                /// باقي الأزرار عادي
                CarProfile(title: "Why Carzato", icon: Icons.article_outlined),
                CarProfile(title: "Logout", icon: Icons.logout,onTap: () {
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignInScreen()),
  );
                  
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}