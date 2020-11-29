import 'dart:async';
import 'dart:core';

import 'package:flutter/services.dart';

class FlutterToastPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_toast_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Null> showToast(String message) async {
    Map<dynamic, dynamic> args = <dynamic, dynamic>{};
    args.putIfAbsent("message", () => message);
    await _channel.invokeMethod('showToast', args);
    return null;
  }
}
