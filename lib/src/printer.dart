import 'package:flutter/services.dart';

/// A class for printer functionality.
class Printer {
  static const MethodChannel _methodChannel = MethodChannel(_methodChannelName);

  static const String _methodChannelName = "printer";

  static const String _havePrinterMethodString = "havePrinter";

  /// Check if the printer is available.
  static Future<bool?> havePrinter() async {
    return await _methodChannel.invokeMethod(_havePrinterMethodString);
  }
}
