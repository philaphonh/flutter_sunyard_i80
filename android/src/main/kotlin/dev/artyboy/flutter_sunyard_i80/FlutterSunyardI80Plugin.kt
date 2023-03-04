package dev.artyboy.flutter_sunyard_i80

import com.socsi.smartposapi.DeviceMaster

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** FlutterSunyardI80Plugin */
class FlutterSunyardI80Plugin: FlutterPlugin {
  /** Method channel for [PrinterModule] */
  private lateinit var printerChannel: MethodChannel

  /** Method channel string of [printerChannel] */
  private val printerChannelName: String = "printer"

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val isDeviceAvailable = System.getProperty("http.agent").contains("i80")
    if (isDeviceAvailable) {
      DeviceMaster.getInstance().init(flutterPluginBinding.applicationContext)

      printerChannel = MethodChannel(flutterPluginBinding.binaryMessenger, printerChannelName)
      printerChannel.setMethodCallHandler(PrinterMethodCallHandler(PrinterModule(flutterPluginBinding.applicationContext)))
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    printerChannel.setMethodCallHandler(null)
  }
}
