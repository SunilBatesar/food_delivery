import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/services/icons_image.dart';
import 'AllFunction/allfunction.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  gotonewscreen() {
    return Future.delayed(Duration(seconds: 2),
        () => AppServices.pushandRemove(HomePage(), context));
  }

  initializeData() async {
    if (!await rebuild()) return;
    await AllFunction().items(context);
    await AllFunction().category(context);
    gotonewscreen();
  }

// -------------- Rebuild Function----
// -----------------
  Future<bool> rebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: AppServices.getscreenwidth(context),
          height: AppServices.getscreenheight(context),
          child: Image.asset(AppImage.bgimage),
        )
      ],
    ));
  }
}
