import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const CarProfile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 22.sp, color: Colors.black54),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 18.sp, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}