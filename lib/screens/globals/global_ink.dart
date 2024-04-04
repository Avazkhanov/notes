import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors/app_colors.dart';

class GlobalInk extends StatelessWidget {
  const GlobalInk({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: AppColors.c_3B3B3B,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: onTap,
        child: Icon(
          icon,
          size: 22.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
