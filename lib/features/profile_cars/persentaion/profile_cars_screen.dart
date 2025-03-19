import 'package:flutter/material.dart';
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
      create: (context) => ProfileBloc(profileRepository: ProfileRepository())..add(LoadProfile()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProfileLoaded) {
                      return HeaderProfile(firstname: state.firstname, phonenumber: state.phonenumber);
                    } else {
                      return HeaderProfile(firstname: "Unknown", phonenumber: "No Phone");
                    }
                  },
                ),
                SizedBox(height: 16.h),
                CarProfile(title: "My Bookings", icon: Icons.calendar_today),
                CarProfile(title: "Why Carzato", icon: Icons.article_outlined),
                CarProfile(title: "Logout", icon: Icons.logout),
              ],
            ),
          ),
        ),
      ),
    );
  }
}