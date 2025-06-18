import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/ai_recommendaion/show_ai_screen.dart';
import 'package:flutter_application_1/features/ai_recommendaion/widgets/header_ai.dart';



import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiRecommendaionScreen extends StatelessWidget {
  AiRecommendaionScreen({super.key});

  final TextEditingController budget = TextEditingController();
  final TextEditingController location = TextEditingController();

  void getRecommendation(BuildContext context, String budget, String location) async {
    final url = Uri.parse('http://10.0.2.2:5000/recommend'); // Use 10.0.2.2 for Android emulator
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'budget': budget,
          'location': location,
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        if (data.isEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("No Results"),
              content: Text("No car recommendations found for your input."),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Recommended Cars"),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.map((car) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "${car['Make']} ${car['Model']} - ${car['Price']} (${car['City']})",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }
      } else {
        throw Exception("API Error ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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

                // Text fields
                Padding(
                   padding:  EdgeInsets.only(left: 12.w,right: 12.w),
                
                  child: TextField(
                    controller: budget,
                    keyboardType: TextInputType.number,
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
                SizedBox(height: 20.h),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w,right: 12.w),
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
                SizedBox(height: 40.h),

                // Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      String enteredBudget = budget.text.trim();
                      String enteredLocation = location.text.trim();
                      getRecommendation(context, enteredBudget, enteredLocation);
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShowAiScreen()),
  );
                    },
                     style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.mainBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            minimumSize: Size(135.w, 42.h)),
                    
                
                    child: Text(
                      "Show Me The Car",
                       style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
