import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String text;
  String? icon;
  Color bgcolor, textcolor;
  Function onPressed;
  bool? alignment;
  AppButton(
      {super.key,
      required this.text,
      required this.bgcolor,
      required this.textcolor,
      required this.onPressed,
      this.alignment = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            alignment: alignment! ? Alignment.centerLeft : Alignment.center,
            backgroundColor: bgcolor,
            minimumSize: Size(AppServices.getscreenwidth(context), 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp))),
        onPressed: () {
          onPressed();
        },
        icon: icon == null
            ? const SizedBox()
            : Image.asset(
                icon!,
                width: 20.w,
              ),
        label: Text(
          text,
          style: AppTextTheme.fs17SemiBold().copyWith(color: textcolor),
        ));
  }
}
