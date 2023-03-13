import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'MyColors.dart';



class Loader {
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  BuildContext? context;

  static final Loader _singleton = new Loader._private();

  static Loader getInstance() {
    return _singleton;
  }

  Loader._private();

  showOverlay(BuildContext context) async {

    if (overlayState == null) {
      this.context = context;
      overlayState = Overlay.of(context);
      overlayEntry = OverlayEntry(
          builder: (context) => GestureDetector(
            onTap: () {},
            child: Container(
              height: 150.h,
              width:  150.w,
              color: Colors.transparent,
              child: Center(child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: new Container(
                      width: 90.h,
                      height:90.h,
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade500.withOpacity(0.3),
//                        color: MyColors.ThemeColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: new Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: SpinKitFadingCircle(color: MyColors.ThemeColor,size: 65.sp,)
                          ),
                        ],
                      ),
                    ),
                  )
              )),
            ),

          ));

      // WidgetsBinding.instance.addPostFrameCallback((_) => overlayState?.insert(overlayEntry));
      overlayState?.insert(overlayEntry!);
    }
  }


  dismissOverlay() {
    if (overlayState!=null) {
      overlayEntry?.remove();
      overlayEntry = null;
      overlayState = null;
    }
  }


}
