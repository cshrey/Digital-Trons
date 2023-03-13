import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helperClass/LogHelperClass.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  var isLogin = "";

  Future check() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LogHelper('connected');
        return true;
      }
    } on SocketException catch (_) {
      LogHelper('not connected');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Internet Connection Required!",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromRGBO(130, 22, 27, 11))),
                  onPressed: () async {

                    check().then((intenet) {
                      if (intenet) {
                        //LogHelper("Intenet "+intenet);

                          // Future.delayed(const Duration(milliseconds: 100),
                          //         () async {
                          //       Navigator.of(context).pushAndRemoveUntil(
                          //           CupertinoPageRoute(
                          //               builder: (context) => HomePage()),
                          //               (route) => false);
                          //     });

                      } else {}
                    });
                  },
                  icon: Icon(Icons.refresh),
                  label: Text("Refresh"))
            ],
          ),
        ),
      ),
    );
  }
}
