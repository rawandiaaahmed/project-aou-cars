import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  LatLng _currentPosition = LatLng(30.0444, 31.2357); // Default to Cairo
  String _address = "Fetching address...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if GPS is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    // Get address from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    setState(() {
      _address = placemarks.first.street! +
          ", " +
          placemarks.first.locality! +
          ", " +
          placemarks.first.country!;
    });

    // Move map to current location
    mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Sell Cars', style: TextStyle(color: Colors.black, fontSize: 18.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **شريط التقدم**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.directions_car, color: Colors.green, size: 24.sp),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Car Details',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Step 3 Of 4',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Next: Personal Details',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            /// **خط التقدم**
            Row(
              children: [
                Expanded(child: Divider(color: Colors.green, thickness: 2.h)),
                Expanded(child: Divider(color: Colors.green, thickness: 2.h)),
                Expanded(child: Divider(color: Colors.green, thickness: 2.h)),
                Expanded(child: Divider(color: Colors.grey.shade300, thickness: 2.h)),
              ],
            ),
            SizedBox(height: 20.h),

            /// **عنوان البحث عن الموقع**
            Text(
              'Locate your address below',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),

            /// **حقل البحث عن الموقع**
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for area, street, landmark',
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(height: 10.h),

            /// **عرض الخريطة**
            Expanded(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
                initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 10),
                markers: {
                  Marker(
                    markerId: MarkerId("currentLocation"),
                    position: _currentPosition,
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  ),
                },
              ),
            ),
            SizedBox(height: 10.h),

            /// **العنوان الحالي**
            Text(
              "Address: $_address",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),

            /// **زر Next**
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  // الانتقال إلى الخطوة التالية (إضافة بيانات المستخدم)
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}