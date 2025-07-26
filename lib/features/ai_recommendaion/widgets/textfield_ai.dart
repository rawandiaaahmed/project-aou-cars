import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextfieldAi extends StatelessWidget {
 TextfieldAi({super.key});
 final budget = TextEditingController();
  final location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
                    padding:  EdgeInsets.only(left: 12.w,right: 12.w),
                    child: TextField(
                      controller: budget,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.sackDollar, size: 18.sp,),
                            hintText: 'Budget',hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            
                           focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide:
                                                BorderSide(color:ColorsManager.mainBlue),
                                          ),
                                            enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )
                          ),
                        ),
                  ),
                   Padding(
                    padding:  EdgeInsets.only(left: 12.w,right: 12.w,top: 23.w),
                    child: TextField(
                      controller: location,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.locationDot, size: 18.sp,),
                            hintText: 'Location',hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            
                            focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide:
                                                BorderSide(color: ColorsManager.mainBlue),
                                          ),
                                            enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )
                          ),
                        ),
                  ),
      ],
    );
  }
}
