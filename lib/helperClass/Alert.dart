import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Alert{


  //Alert dialog
  showAlertDialog(BuildContext context, String title, String message){
    showDialog(
        context: context,
        builder: (alertcontext){
          if(title == ""){
            return CupertinoAlertDialog(
              content: new Text(message,style: GoogleFonts.openSans()),
              actions: <Widget>[
                new CupertinoButton(
                  onPressed: (){
                    Navigator.of(alertcontext).pop();
                  },
                  child: new Text("OK",style:GoogleFonts.openSans(color: CupertinoColors.activeBlue)),
                )
              ],
            );
          }
          else{
            return CupertinoAlertDialog(
              title: new Text(title,style: GoogleFonts.openSans()),
              content: new Text(message,style: GoogleFonts.openSans()),
              actions: <Widget>[
                new CupertinoButton(
                  onPressed: (){
                    Navigator.of(alertcontext).pop();
                  },
                  child: new Text("OK",style:GoogleFonts.openSans(color: CupertinoColors.activeBlue)),
                )
              ],
            );
          }
        }
    );
  }



//Alert dialog with back navigation
  showAlertDialogWithBackNavigation(BuildContext context, String title, String message){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (alertcontext){
          if(title == ""){
            return CupertinoAlertDialog(
              content: new Text(message,style: GoogleFonts.openSans()),
              actions: <Widget>[
                new CupertinoButton(
                  onPressed: (){
                    Navigator.of(alertcontext).pop();
                    Navigator.of(alertcontext).pop();
                  },
                  child: new Text("OK",style:GoogleFonts.openSans(color: CupertinoColors.activeBlue)),
                )
              ],
            );
          }
          else{
            return CupertinoAlertDialog(
              title: new Text(title,style: GoogleFonts.openSans()),
              content: new Text(message,style: GoogleFonts.openSans()),
              actions: <Widget>[
                new CupertinoButton(
                  onPressed: (){
                    Navigator.of(alertcontext).pop();
                    Navigator.of(alertcontext).pop();
                  },
                  child: new Text("OK",style:GoogleFonts.openSans(color: CupertinoColors.activeBlue)),
                )
              ],
            );
          }
        }
    );
  }

/* showLogOutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (alertcontext) {
          return CupertinoAlertDialog(
            content: new Text("Are you sure you want to logout?"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(alertcontext).pop();
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Yes"),
                onPressed: () {
                 // IntelUtility.navigateReplaceToScreen(context, LogInWithOtp());
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                          builder: (context) => Login()));
                },
              ),
            ],
          );
        });
  }*/
}