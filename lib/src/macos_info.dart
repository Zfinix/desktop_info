import 'dart:async';
import 'package:flutter/services.dart';

/// Preferred data output type
enum MacOSInfoType {
  basic,
  mini,
  // full,
}

/// Preferred scope of output
enum MacOSInfoResultType {
  json,
  xml,
}

/// MacOS System Info
class MacOSInfo {
  static const MethodChannel _channel = const MethodChannel('desktop_info');

  /// Load System Info
  static Future<String> systemInfo({
    MacOSInfoType type = MacOSInfoType.mini,
    MacOSInfoResultType resultType = MacOSInfoResultType.json,
  }) async {
    String info = await _channel.invokeMethod('getInfo', {
      "type": '$type'.replaceAll('MacOSInfoType.', ''),
      "resultType": '$resultType'.replaceAll('MacOSInfoResultType.', ''),
    });
    return info;
  }
}
