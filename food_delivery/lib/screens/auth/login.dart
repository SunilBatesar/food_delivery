import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/AllFunction/allfunction.dart';
import 'package:food_delivery/controllers/textvalidatorcontroller.dart';
import 'package:food_delivery/helpers/app_btn.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/helpers/text_field.dart';
import 'package:food_delivery/services/icons_image.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  Function? onPressed;
  LoginPage({super.key, this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController numbercontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _key,
            child: Column(
              children: [
                TextFieldcommon(
                  text: "Username, Mobile Number",
                  validator: (v) =>
                      Textvalidatorcontroller.phonenumbertextvalidator(v),
                  controller: numbercontroller,
                ),
                AppServices.addheight(18.h),
                TextFieldcommon(
                  text: "Password",
                  validator: (v) =>
                      Textvalidatorcontroller.passwordtextvalidator(v),
                  controller: passwordcontroller,
                ),
              ],
            ),
          ),
          AppServices.addheight(18.h),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  widget.onPressed!();
                },
                child: Text(
                  "Forgot password?",
                  style: AppTextTheme.fs14SemiBold()
                      .copyWith(color: AppColor.orange),
                )),
          ),
          AppServices.addheight(25.h),
          AppButton(
              text: "Login",
              bgcolor: AppColor.orange,
              textcolor: AppColor.white,
              onPressed: () {
                getvalidtext(context);
              }),
          AppServices.addheight(13.h),
          Text(
            "or",
            style: AppTextTheme.fs18SemiBold(),
          ),
          AppServices.addheight(30.h),
          AppButton(
              text: "Log In with Facebook",
              bgcolor: AppColor.blue,
              textcolor: AppColor.white,
              icon: AppIcon.facebookLogo,
              onPressed: () {}),
          AppServices.addheight(18.h),
          AppButton(
              text: "Log In with Google",
              bgcolor: AppColor.white,
              textcolor: AppColor.grey,
              icon: AppIcon.googleLogo,
              onPressed: () {}),
        ],
      ),
    );
  }

  getvalidtext(BuildContext context) {
    if (_key.currentState!.validate()) {
      AllFunction()
          .login(numbercontroller.text, passwordcontroller.text, context);
    }
  }
}
