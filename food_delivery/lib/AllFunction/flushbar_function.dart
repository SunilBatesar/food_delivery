import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/services/style_sheet.dart';

flushbarFunction(String error, BuildContext context) {
  return Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: AppColor.redbg,
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          // duration: const Duration(seconds: 2),
          margin: const EdgeInsets.fromLTRB(5, kToolbarHeight + 5, 5, 0),
          padding: EdgeInsets.all(5.sp),
          borderRadius: BorderRadius.circular(20.r),
          messageText: Text(error.toString(),
              style: AppTextTheme.fs12Light().copyWith(color: AppColor.white)))
      .show(context);
}
