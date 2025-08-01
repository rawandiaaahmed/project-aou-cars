import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/repository/user_repository.dart';
import 'package:flutter_application_1/features/home/logic/bloc/user_bloc.dart';
import 'package:flutter_application_1/features/home/logic/bloc/user_event.dart';
import 'package:flutter_application_1/features/home/logic/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/ai_recommendaion/ai_recommendaion_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(FetchUserName()),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: ColorsManager.mainBlue,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/auth.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/auth.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35.h,
            left: 15.w,
            right: 15.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CARZATO",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AiRecommendaionScreen()),
                          );
                        },
                        child: Text(
                          'AI Recommendations?',
                          style: TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return Text(
                            "Loading...",
                            style: TextStyle(color: Colors.white),
                          );
                        } else if (state is UserLoaded) {
                          return Text(
                            "Welcome Back, ${state.name}",
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          return Text(
                            "Welcome Back, Guest",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}