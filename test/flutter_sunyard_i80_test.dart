import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sunyard_i80/flutter_sunyard_i80.dart';
import 'package:flutter_sunyard_i80/flutter_sunyard_i80_platform_interface.dart';
import 'package:flutter_sunyard_i80/flutter_sunyard_i80_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSunyardI80Platform
    with MockPlatformInterfaceMixin
    implements FlutterSunyardI80Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSunyardI80Platform initialPlatform = FlutterSunyardI80Platform.instance;

  test('$MethodChannelFlutterSunyardI80 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSunyardI80>());
  });

  test('getPlatformVersion', () async {
    FlutterSunyardI80 flutterSunyardI80Plugin = FlutterSunyardI80();
    MockFlutterSunyardI80Platform fakePlatform = MockFlutterSunyardI80Platform();
    FlutterSunyardI80Platform.instance = fakePlatform;

    expect(await flutterSunyardI80Plugin.getPlatformVersion(), '42');
  });
}
