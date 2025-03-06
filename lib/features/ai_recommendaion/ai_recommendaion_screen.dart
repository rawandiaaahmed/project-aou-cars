import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/ai_recommendaion/widgets/buttom.dart';
import 'package:flutter_application_1/features/ai_recommendaion/widgets/header_ai.dart';


import 'package:flutter_application_1/features/ai_recommendaion/widgets/textfield_ai.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';



class AiRecommendaionScreen extends StatelessWidget {
   AiRecommendaionScreen({super.key});
  final budget = TextEditingController();
  final location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderAi(),
            
               Padding(
                 padding:  EdgeInsets.only(top: 15.w,bottom: 15.w,left: 10.w,right: 60.w),
                 child: Text(
                      "Please enter your  budget and location, and the AI will recommend a suitable car for you",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,),
                      softWrap: true,
                      maxLines: 3,
                    ),
               ),
                  SizedBox(height: 20.h),
                 TextfieldAi(),
                  SizedBox(height: 200.h,),
                 Buttom(),

            ],
          ),
        ),
      ),
    );
  }
}