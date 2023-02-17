import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sunyard_i80/flutter_sunyard_i80_method_channel.dart';

void main() {
  MethodChannelFlutterSunyardI80 platform = MethodChannelFlutterSunyardI80();
  const MethodChannel channel = MethodChannel('flutter_sunyard_i80');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
