// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/theming/color_manager.dart';

class TextFieldSellCar extends StatelessWidget {
  TextFieldSellCar({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
  }) : super(key: key);
  final String label;
   final String hint;
   
    final TextEditingController controller;

   
 
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
       key: formkey,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: controller,
               validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 1) {
                                          return 'please enter a vaild password';
                                        } else {
                                          return null;
                                        }
                                      },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
               
               
                 enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                 focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              borderSide:
                                                  BorderSide(color: ColorsManager.mainBlue),
                                            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
