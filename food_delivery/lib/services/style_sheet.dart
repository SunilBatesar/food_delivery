import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color redbg = Color(0xffFF4B3A);
  static const Color orange = Color(0xffF8774A);
  static const Color grey = Color(0xffa0a0a099);
  static const Color lightgrey = Color(0xffF2F2F2);
  static const Color greydark = Color(0xff626262);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color blue = Color(0xff1877F2);
  static const Color green = Color(0xff079D49);
  static const Color lightgreen = Color(0xff57C2A7);
  static const Color lightgreen2 = Color(0xff97D5C8);
  static const Color lightyellow = Color(0xffFDF9EA);
}

class AppTextTheme {
// -------Thin---
  static TextStyle fs55Thin() =>
      GoogleFonts.poppins(fontSize: 55.sp, fontWeight: FontWeight.w100);
  static TextStyle fs40Thin() =>
      GoogleFonts.poppins(fontSize: 40.sp, fontWeight: FontWeight.w100);

// -------Light---
  static TextStyle fs10Light() =>
      GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w300);
  static TextStyle fs12Light() =>
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w300);
  static TextStyle fs14Light() =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w300);

// -------Normal---
  static TextStyle fs10Normal() =>
      GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w400);
  static TextStyle fs11Normal() =>
      GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w400);
  static TextStyle fs12Normal() =>
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle fs13Normal() =>
      GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w400);
  static TextStyle fs14Normal() =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle fs15Normal() =>
      GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w400);
  static TextStyle fs16Normal() =>
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static TextStyle fs18Normal() =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w400);
  static TextStyle fs19Normal() =>
      GoogleFonts.poppins(fontSize: 19.sp, fontWeight: FontWeight.w400);
  static TextStyle fs24Normal() =>
      GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w400);

// -------Medium---
  static TextStyle fs10Medium() =>
      GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500);
  static TextStyle fs13Medium() =>
      GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500);
  static TextStyle fs14Medium() =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle fs18Medium() =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500);
  static TextStyle fs17Medium() =>
      GoogleFonts.poppins(fontSize: 17.sp, fontWeight: FontWeight.w500);
  static TextStyle fs21Medium() =>
      GoogleFonts.poppins(fontSize: 21.sp, fontWeight: FontWeight.w500);

// -------Semi Bold---
  static TextStyle fs14SemiBold() =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600);
  static TextStyle fs16SemiBold() =>
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static TextStyle fs17SemiBold() =>
      GoogleFonts.poppins(fontSize: 17.sp, fontWeight: FontWeight.w600);
  static TextStyle fs18SemiBold() =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static TextStyle fs20SemiBold() =>
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600);

// -------Bold---
  static TextStyle fs10Bold() =>
      GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w700);
  static TextStyle fs13Bold() =>
      GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700);
  static TextStyle fs14Bold() =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700);
  static TextStyle fs17Bold() =>
      GoogleFonts.poppins(fontSize: 17.sp, fontWeight: FontWeight.w700);
  static TextStyle fs18Bold() =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static TextStyle fs20Bold() =>
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static TextStyle fs36Bold() =>
      GoogleFonts.poppins(fontSize: 36.sp, fontWeight: FontWeight.w700);

// -------Extra-bold---
  static TextStyle fs18Extrabold() =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w800);

// -------Thickest ---
  static TextStyle fs20Thickest() =>
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w900);
  static TextStyle fs21Thickest() =>
      GoogleFonts.poppins(fontSize: 21.sp, fontWeight: FontWeight.w900);
}
