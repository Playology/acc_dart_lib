import 'dart:io';

import 'package:acc_dart_lib/src/unsuppoted_platform_exception.dart';

class PlatformChecker {
  static throwIfNotWindows() {
    if(Platform.isWindows) {
      return;
    }

    throw UnsuppotedPlatformException();
  }
}
