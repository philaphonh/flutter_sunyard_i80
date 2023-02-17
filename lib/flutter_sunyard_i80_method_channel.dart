import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_sunyard_i80_platform_interface.dart';

/// An implementation of [FlutterSunyardI80Platform] that uses method channels.
class MethodChannelFlutterSunyardI80 extends FlutterSunyardI80Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_sunyard_i80');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
