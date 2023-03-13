import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Controller/SplashScreen.dart';
import 'helperClass/MyColors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white.withOpacity(0.0),
    ));
    return ScreenUtilInit(
        designSize: Size(411, 914),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, Widget) {
          return MaterialApp(
            title: "Digital Trons",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                appBarTheme: AppBarTheme(
                  color: MyColors.ThemeColor,
                ),
                primaryColor: MyColors.ThemeColor,
                brightness: Brightness.light,
                cupertinoOverrideTheme:
                CupertinoThemeData(brightness: Brightness.light)),
            darkTheme: ThemeData(brightness: Brightness.light),
            home: SplashScreen(),
          );
        });
  }
}
