import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/app_btn.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/services/app_config.dart';
import 'package:food_delivery/services/icons_image.dart';
import 'package:food_delivery/services/style_sheet.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.redbg,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(40.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: AppColor.white, shape: BoxShape.circle),
                child: Image.asset(AppConfig.AppLogo),
              ),
              AppServices.addheight(40.h),
              Text(
                "Welcome,\n User Name",
                textAlign: TextAlign.center,
                style: AppTextTheme.fs55Thin().copyWith(color: AppColor.white),
              ),
              AppServices.addheight(26.h),
              Text(
                "Unlock the world of regular and rescued food by setting up your delivery address.",
                textAlign: TextAlign.center,
                style: AppTextTheme.fs20SemiBold()
                    .copyWith(color: AppColor.white.withAlpha(80)),
              ),
              AppServices.addheight(50.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SELECT LOCATION",
                  style: AppTextTheme.fs18Extrabold()
                      .copyWith(color: AppColor.white.withAlpha(80)),
                ),
              ),
              AppServices.addheight(27.h),
              AppButton(
                text: "Locate Me",
                bgcolor: AppColor.white,
                textcolor: AppColor.orange,
                onPressed: () {},
                icon: AppIcon.locateme,
                alignment: true,
              ),
              AppServices.addheight(27.h),
              AppButton(
                text: "Locate Me",
                bgcolor: AppColor.white,
                textcolor: AppColor.orange,
                onPressed: () {},
                icon: AppIcon.providelocation,
                alignment: true,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
