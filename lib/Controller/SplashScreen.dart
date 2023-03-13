import 'dart:async';
import 'dart:io';

import 'package:digital_trons_prac/Controller/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1500),
            () => Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => HomePage(
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
alignment: Alignment.center,
          child: Image(
              height: 120,
              width: 120,
              image: AssetImage("assets/company_logo.png"))),
    );
  }
}
