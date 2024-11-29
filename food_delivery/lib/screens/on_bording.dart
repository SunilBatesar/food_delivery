import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/controllers/dummy_data.dart';
import 'package:food_delivery/helpers/app_btn.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/services/app_config.dart';
import 'package:food_delivery/services/style_sheet.dart';

class On_Bording_Page extends StatefulWidget {
  const On_Bording_Page({super.key});

  @override
  State<On_Bording_Page> createState() => _On_Bording_PageState();
}

class _On_Bording_PageState extends State<On_Bording_Page> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: AppServices.getscreenwidth(context),
            height: AppServices.getscreenheight(context),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xffFF4B3A),
                  Color(0xffFF4B3A),
                  Color(0xffFF4B3A),
                  Color(0xffFF470B),
                ])),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "SKIP >>",
                              style: AppTextTheme.fs18SemiBold().copyWith(
                                  color: AppColor.white.withAlpha(110)),
                            )),
                      ),
                      Image.asset(AppConfig.AppLogo),
                      CarouselSlider(
                          items: DummyData.onBordingData
                              .map((e) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.text,
                                        style: AppTextTheme.fs40Thin()
                                            .copyWith(color: AppColor.white),
                                      ),
                                      Image.asset(
                                        e.image,
                                        width: 400,
                                      )
                                    ],
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            // autoPlay: true,
                            aspectRatio: 0.6,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) =>
                                setState(() => currentIndex = index),
                          )),
                      currentIndex == 2
                          ? AppButton(
                              text: "Get started!",
                              bgcolor: AppColor.white,
                              textcolor: AppColor.orange,
                              onPressed: () {},
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  3,
                                  (index) => Padding(
                                        padding: EdgeInsets.all(8.0.sp),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          height: 10.h,
                                          width: currentIndex == index
                                              ? 25.w
                                              : 10.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              shape: BoxShape.rectangle,
                                              color: AppColor.white),
                                        ),
                                      )),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
