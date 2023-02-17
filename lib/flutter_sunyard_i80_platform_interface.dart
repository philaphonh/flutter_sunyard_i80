import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sunyard_i80_method_channel.dart';

abstract class FlutterSunyardI80Platform extends PlatformInterface {
  /// Constructs a FlutterSunyardI80Platform.
  FlutterSunyardI80Platform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSunyardI80Platform _instance = MethodChannelFlutterSunyardI80();

  /// The default instance of [FlutterSunyardI80Platform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSunyardI80].
  static FlutterSunyardI80Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSunyardI80Platform] when
  /// they register themselves.
  static set instance(FlutterSunyardI80Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
