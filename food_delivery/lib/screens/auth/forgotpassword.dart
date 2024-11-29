import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/helpers/text_field.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class ForgotPasswordPage extends StatelessWidget {
  Function onPressed;
  ForgotPasswordPage({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                color: AppColor.grey,
                onPressed: () {
                  onPressed();
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
          Text(
            "Forgot \npassword?",
            style: AppTextTheme.fs36Bold().copyWith(color: AppColor.orange),
          ),
          AppServices.addheight(28.h),
          TextFieldcommon(
            text: "Enter your email address",
            icon: Icons.email,
          ),
          AppServices.addheight(28.h),
          Text(
            "* We will send you a message to set or reset your new password",
            style: AppTextTheme.fs12Normal().copyWith(color: AppColor.grey),
          ),
          AppServices.addheight(34.h),
          TextButton(
              onPressed: () {},
              child: Text(
                "Send code",
                style: AppTextTheme.fs24Normal().copyWith(color: AppColor.grey),
              ))
        ],
      ),
    );
  }
}
