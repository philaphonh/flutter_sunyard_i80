
import 'flutter_sunyard_i80_platform_interface.dart';

class FlutterSunyardI80 {
  Future<String?> getPlatformVersion() {
    return FlutterSunyardI80Platform.instance.getPlatformVersion();
  }
}
