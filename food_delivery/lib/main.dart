import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/controllers/all_controllers.dart';
import 'package:food_delivery/controllers/database_controllers/databasehandler_uri_controllers.dart';
import 'package:food_delivery/services/app_config.dart';
import 'package:food_delivery/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllControllers()),
        ChangeNotifierProvider(create: (context) => DatabaseHandlerController())
      ],
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          home: Splash_page(),
        ),
        designSize: Size(AppConfig.screenwidth, AppConfig.screenheight),
      ),
    );
  }
}
