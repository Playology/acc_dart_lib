import 'dart:convert';
import 'dart:io';

import 'package:acc_dart_lib/src/models/acc_broadcast_settings.dart';
import 'package:acc_dart_lib/src/platform_checker.dart';
import 'package:charset/charset.dart';

import 'acc_path_provider.dart';

/// Provides access to data maintained by Assetto Corsa Competizione within the Windows Documents folder
class AccDataProvider {

  /// Gets the configuration ACC will use for broadcasting
  ///
  /// Throws [UnsupportedPlatformException] if platform is not Windows
  static Future<AccBroadcastSettings> getBroadcastSettings() async {
    PlatformChecker.throwIfNotWindows();

    final filePath = await AccPathProvider.getBroadcastFilePath();
    final file = File(filePath);
    final exists = await file.exists();
    if (!exists) {
      return AccBroadcastSettings();
    } else {
      final encoder = Utf16Decoder();
      final bytes = await file.readAsBytes();
      final contents = encoder.decodeUtf16Le(bytes);
      final json = jsonDecode(contents);
      return AccBroadcastSettings.fromJson(json);
    }
  }
}
