import 'package:flutter/material.dart';

class AppServices {
  // Get screen Height and width
  static getscreenheight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static getscreenwidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // --Space Size Box ----

  static addheight(double height) => SizedBox(
        height: height,
      );
  static addwidth(double width) => SizedBox(
        width: width,
      );

  // Timer Push ------

  static pushto(Widget screen, BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

  static pushandRemove(Widget screen, BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);
  static pushReplace(Widget screen, BuildContext context) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));

  //  Pop ------
  static popView(BuildContext context) => Navigator.pop(context);
}
