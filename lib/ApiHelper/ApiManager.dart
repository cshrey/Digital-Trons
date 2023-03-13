import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../NoInternetScreen/NoInternetConnection.dart';
import '../helperClass/Alert.dart';
import '../helperClass/LogHelperClass.dart';
import '../helperClass/ProgressBar.dart';

String apiKey = "f34eb5fc94dd46371e7953221e43eb2b";

class ApiManager {
  static bool showLog = true;


  static String baseUrl = "https://api.themoviedb.org/3/";

  Future<dynamic> callGetApi(
      BuildContext context, String webLink, bool showLoading) async {
    if (showLoading) {
      Loader.getInstance().showOverlay(context);
    }

    Dio dio = Dio();
    try {
      var response = await dio.get(webLink,
          options: Options(
              headers: {"Content-Type": "application/json", "api_key": apiKey}));
      var data = response.data;
      var message = response.data;
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
       //  showLoader(context, false);
      }

      if (showLog) {
        log("\n\n**************************URL**************************\n\n$webLink\n\n");
        log("\n\n**************************RESPONSE**************************\n\n$data\n\n");
      }
      return data;
    } on DioError catch (error) {
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
      //  showLoader(context, false);
      }
      log(error.toString());
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log("Server is not reachable. Please verify your internet connection and try again");
        if (showLoading) {
          Loader.getInstance().dismissOverlay();
        //  showLoader(context, false);
        }
        Alert().showAlertDialog(context, "Server Unreachable",
            "Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log("Url is not found or Page is missing. Please check Url.");
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          //  showLoader(context, false);
          }
        } else if (error.response!.statusCode == 406) {
          log("Request or parameter are bad which not acceptable by server. Please check requests or parameters.");
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          //  showLoader(context, false);
          }
        } else if (error.response!.statusCode == 500) {
          log("Internal Sever Error");
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          //  showLoader(context, false);
          }
        }
      } else if (error.message.contains('SocketException')) {
        log("Please check your internet connection and try again");

        if (showLoading) {
          Loader.getInstance().dismissOverlay();
        //  showLoader(context, false);
        }
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => NoInternetConnection()),
                (route) => false);
        // Alert().showAlertDialog(context, "Internet Unavailable",
        //     "Please check your internet connection and try again");
      }
    }
  }

  // Post API
  Future<dynamic> callPostApi(BuildContext context, String webLink,
      Object params, bool showLoading) async {
    if (showLoading) {
      Loader.getInstance().showOverlay(context);
    }
    // check().then((intenet) {
    //   LogHelper("Intenet "+intenet.toString());
    //   if (intenet != null && intenet) {
    //     // Internet Present Case
    //   } else {
    //     Future.delayed(const Duration(milliseconds: 100), () {
    //       Loader.getInstance().dismissOverlay();
    //       Navigator.of(context).pushAndRemoveUntil(
    //           CupertinoPageRoute(builder: (context) => NoInternetConnection()),
    //               (route) => false);
    //     });
    //   }
    // });

    Dio dio = Dio();
    try {
      var response = await dio.post(webLink,
          data: params,
          options: Options(headers: {"Content-Type": "application/json"}));
      var data = response.data;
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
      }
      if (showLog) {
        log("\n\n**************************URL**************************\n\n$webLink\n\n");
        log("\n\n**************************REQUESTS**************************\n\n${jsonEncode(params)}\n\n");
        log("\n\n**************************RESPONSE**************************\n\n$data\n\n");
      }
      return response.data;
    } on DioError catch (error) {
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
      }
      log(error.toString());
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log("Server is not reachable. Please verify your internet connection and try again");
        if (showLoading) {
          Loader.getInstance().dismissOverlay();
        }
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          }
          log("Url is not found or Page is missing. Please check Url.");
        } else if (error.response!.statusCode == 406) {
          log("Request or parameter are bad which not acceptable by server. Please check requests or parameters.");
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          }
        } else if (error.response!.statusCode == 500) {
          log("Internal Sever Error");
          if (showLoading) {
            Loader.getInstance().dismissOverlay();
          }
        }
      } else if (error.message.contains('SocketException')) {
        log("Please check your internet connection and try again");
        if (showLoading) {
          Loader.getInstance().dismissOverlay();
        }
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => NoInternetConnection()),
                (route) => false);
        // Alert().showAlertDialog(context, "Internet Connection",
        //     "Please check your internet connection and try again");
      }
    }
  }

  Future<dynamic> callMultiPartApi(BuildContext context, String webLink,
      FormData params, bool showLoading) async {
    if (showLoading) {
      Loader.getInstance().showOverlay(context);
    }
    // check().then((intenet) {
    //   LogHelper("Intenet "+intenet.toString());
    //   if (intenet != null && intenet) {
    //     // Internet Present Case
    //   } else {
    //     Future.delayed(const Duration(milliseconds: 100), () {
    //       Loader.getInstance().dismissOverlay();
    //       Navigator.of(context).pushAndRemoveUntil(
    //           CupertinoPageRoute(builder: (context) => NoInternetConnection()),
    //               (route) => false);
    //     });
    //   }
    // });

    Dio dio = Dio();
    try {
      var response;
      response = await dio.post(webLink, data: params);
      var data = response.data;
      LogHelper(data);
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
      }
      if (showLog) {
        log("\n\n**************************URL**************************\n\n$webLink\n\n");
        // log("\n\n**************************REQUESTS**************************\n\n${jsonEncode(params)}\n\n");
        log("\n\n**************************RESPONSE**************************\n\n$data\n\n");
      }
      return data;
    } on DioError catch (error) {
      if (showLoading) {
        Loader.getInstance().dismissOverlay();
      }
      log(error.toString());
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log("Server is not reachable. Please verify your internet connection and try again");
        Alert().showAlertDialog(context, "Server Unreachable",
            "Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log("Url is not found or Page is missing. Please check Url.");
        } else if (error.response!.statusCode == 500) {
          log("Internal Sever Error");
          Alert().showAlertDialog(
              context, "Server Unreachable", "Internal Sever Error");
        } else if (error.message.contains('SocketException')) {
          log("Please check your internet connection and try again");

            Navigator.of(context).pushAndRemoveUntil(
                CupertinoPageRoute(
                    builder: (context) => NoInternetConnection()),
                    (route) => false);

          // Alert().showAlertDialog(context, "Internet Unavailable",
          //     "Please check your internet connection and try again");
        }
      }
    }
  }

// void showLoader(BuildContext context, bool show) {
//   if (show) {
//     showDialog(
//         context: context,
//         barrierColor: Colors.white.withOpacity(0.0),
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return Center(
//               child: SpinKitWave(
//             color: MyColors.ThemeColor,
//           ));
//         });
//   } else {
//     Navigator.of(context, rootNavigator: true).pop("");
//   }
// }
}
