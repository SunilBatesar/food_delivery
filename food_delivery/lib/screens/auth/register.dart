import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/app_btn.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/helpers/text_field.dart';
import 'package:food_delivery/services/icons_image.dart';
import 'package:food_delivery/services/style_sheet.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppServices.addheight(27.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Register",
                style: AppTextTheme.fs36Bold().copyWith(color: AppColor.orange),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                    child: Image.asset(
                      AppIcon.googleLogo,
                      width: 27.w,
                    ),
                  ),
                  AppServices.addwidth(10.w),
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                    child: Icon(
                      Icons.facebook,
                      size: 30.sp,
                      color: AppColor.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
          AppServices.addheight(27.h),
          TextFieldcommon(text: "Full Name"),
          AppServices.addheight(20.h),
          TextFieldcommon(text: "Mobile Number"),
          AppServices.addheight(20.h),
          TextFieldcommon(text: "Password"),
          AppServices.addheight(20.h),
          TextFieldcommon(text: "Confirm Password"),
          AppServices.addheight(20.h),
          Row(
            children: [
              Expanded(
                child: AppButton(
                    text: "Sign-up",
                    bgcolor: AppColor.orange,
                    textcolor: AppColor.white,
                    onPressed: () {}),
              ),
              AppServices.addwidth(5.w),
              Expanded(
                  child: TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                      text: "Already a Member? ",
                      style: AppTextTheme.fs16Normal()
                          .copyWith(color: AppColor.grey),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "Login",
                            style: TextStyle(
                                color: Color(0xffB3B3B3),
                                fontWeight: FontWeight.w700))
                      ]),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
