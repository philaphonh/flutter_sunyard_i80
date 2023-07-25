package dev.artyboy.flutter_sunyard_i80

import com.socsi.smartposapi.DeviceMaster

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** FlutterSunyardI80Plugin */
class FlutterSunyardI80Plugin: FlutterPlugin {
  /** Method channel for [PrinterModule] */
  private var printerChannel: MethodChannel? = null

  private var terminalInfoChannel: MethodChannel? = null

  /** Method channel string of [printerChannel] */
  private val printerChannelName: String = "printer"

  private val terminalInfoChannelName: String = "terminal_info"

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val isDeviceAvailable = System.getProperty("http.agent").contains("i80")
    if (isDeviceAvailable) {
      DeviceMaster.getInstance().init(flutterPluginBinding.applicationContext)

      printerChannel = MethodChannel(flutterPluginBinding.binaryMessenger, printerChannelName)
      printerChannel?.setMethodCallHandler(PrinterMethodCallHandler(PrinterModule()))

      terminalInfoChannel = MethodChannel(flutterPluginBinding.binaryMessenger, terminalInfoChannelName)
      terminalInfoChannel?.setMethodCallHandler(TerminalInfoMethodCallHandler(TerminalInfoModule()))
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    printerChannel?.setMethodCallHandler(null)
    terminalInfoChannel?.setMethodCallHandler(null)
  }
}
