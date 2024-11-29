import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class TextFieldcommon extends StatelessWidget {
  String text;
  IconData? icon;
  TextEditingController? controller;
  Function(String)? validator;
  TextFieldcommon({
    super.key,
    required this.text,
    this.icon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator == null ? null : (v) => validator!(v!),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          // ignore: unnecessary_null_comparison
          prefixIcon: Icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  color: AppColor.greydark,
                ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.sp)),
          hintText: text,
          hintStyle: AppTextTheme.fs16Normal().copyWith(color: AppColor.grey)),
    );
  }
}
