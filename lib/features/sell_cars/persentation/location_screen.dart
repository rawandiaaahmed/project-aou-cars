import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/sell_cars/persentation/personal_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(30.0444 ,31.2357), zoom: 14);

  GoogleMapController? gmc;

  List<Marker> markers = [];
  
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Sell Cars',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_car,
                                color: ColorsManager.mainBlue, size: 24.sp),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Car Details',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Step 3 Of 4',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'Next: Personal Details',
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Location your address below',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    Stack(
                      children: [
                            Container(
                            height: 250.h,
                            child: GoogleMap(
                              onTap: (LatLng lating) {
                                markers.add(Marker(
                                    markerId: MarkerId('1'),
                                    position:
                                        LatLng(lating.latitude, lating.longitude)));
                                setState(() {});
                              },
                              initialCameraPosition: cameraPosition,
                              mapType: MapType.normal,
                              onMapCreated: (mapcontroller) {
                                gmc = mapcontroller;
                              },
                              markers: markers.toSet(),
                            )),
                            Form(
                              key: formkey,
                              child: Padding(
                                padding:  EdgeInsets.all(4.h),
                                child: TextFormField(
                                    validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 7) {
                                          return 'please enter a vaild correct';
                                        } else {
                                          return null;
                                        }
                                      },
                                  
                                          
                                         
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                borderSide:
                                                    BorderSide(color: ColorsManager.mainBlue),
                                              ),
                                              hintText: 'Search for area, street, landmark',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                              )),
                                        ),
                              ),
                            ),
                          ],
                    ),
                  Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  
                            
                               Padding(
                                padding:  EdgeInsets.all(4.h),
                                child: TextFormField(
                                    validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 7) {
                                          return 'please enter a vaild correct';
                                        } else {
                                          return null;
                                        }
                                      },
                                  
                                          
                                         
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                borderSide:
                                                    BorderSide(color: ColorsManager.mainBlue),
                                              ),
                                              hintText: 'Address',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                              )),
                                        ),
                              ),
                            
      SizedBox(height: 20.h),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
  );
          },
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.mainBlue,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    ],
  ),
),
                  ]
                  ),
            )));
  }
}
