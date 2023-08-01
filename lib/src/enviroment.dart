import 'package:flutter/foundation.dart';

enum PlatformType {
  web,
  ios,
  android,
}

PlatformType getPlatformType() {
  if (kIsWeb) {
    return PlatformType.web;
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return PlatformType.ios;
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    return PlatformType.android;
  }
  throw Exception("Unsupported platform");
}
