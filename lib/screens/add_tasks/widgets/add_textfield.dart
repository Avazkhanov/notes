import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_style.dart';

class AddTextField extends StatelessWidget {
  const AddTextField(
      {super.key,
      required this.text,
      required this.controller,
      required this.isTitle});

  final String text;
  final TextEditingController controller;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      maxLength: null,
      style: AppStyle.interNunitoBold.copyWith(
        fontSize: isTitle ? 28.sp : 18.sp,
        color: AppColors.c_9A9A9A,
      ),
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: AppStyle.interNunitoBold.copyWith(
            fontSize: isTitle ? 28.sp : 18.sp,
            color: AppColors.c_9A9A9A,
          ),
          border: InputBorder.none
    ),
    );
  }
}
