package dev.artyboy.flutter_sunyard_i80

import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class PrinterMethodCallHandler: MethodCallHandler {
    private lateinit var printerModule: PrinterModule

    constructor(printerModule: PrinterModule) {
        this.printerModule = printerModule
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            printerModule.havePrinterMethodString -> result.success(printerModule.havePrinter())
            else -> result.notImplemented()
        }
    }
}