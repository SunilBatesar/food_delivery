import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/screens/auth/forgotpassword.dart';
import 'package:food_delivery/screens/auth/login.dart';
import 'package:food_delivery/screens/auth/register.dart';
import 'package:food_delivery/services/app_config.dart';
import 'package:food_delivery/services/style_sheet.dart';

class AllAuthPage extends StatefulWidget {
  const AllAuthPage({super.key});

  @override
  State<AllAuthPage> createState() => _AllAuthPageState();
}

class _AllAuthPageState extends State<AllAuthPage> {
  bool forgotbool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                width: AppServices.getscreenwidth(context),
                // height: AppServices.getscreenheight(context) * 0.4,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.sp),
                        bottomRight: Radius.circular(30.sp))),
                child: SafeArea(
                  child: Column(
                    children: [
                      Image.asset(
                        AppConfig.AppLogo_big,
                      ),
                      TabBar(
                          labelColor: AppColor.black,
                          indicatorColor: AppColor.orange,
                          indicatorWeight: 4,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                          tabs: [
                            Text(
                              "Login",
                              style: AppTextTheme.fs18SemiBold(),
                            ),
                            Text(
                              "Sign-up",
                              style: AppTextTheme.fs18SemiBold(),
                            ),
                          ])
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          forgotbool
                              ? LoginPage(onPressed: () {
                                  setState(() {
                                    forgotbool = false;
                                  });
                                })
                              : ForgotPasswordPage(onPressed: () {
                                  setState(() {
                                    forgotbool = true;
                                  });
                                }),
                        ],
                      ),
                    ),
                    RegisterPage(),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
