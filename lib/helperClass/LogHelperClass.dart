import 'dart:developer';

import 'package:flutter/foundation.dart';

String TAG = "Digital Trons---";

LogHelper(Object str) {
  log(TAG + str.toString());
}

classNameLog({required String str}) {
  if (kDebugMode) {
    log("Class Name ---->" + str);
  }
}
