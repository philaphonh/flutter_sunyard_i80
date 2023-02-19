package dev.artyboy.flutter_sunyard_i80

import android.content.Context
import android.util.Log
import com.socsi.exception.SDKException
import com.socsi.smartposapi.printer.PrintRespCode
import com.socsi.smartposapi.printer.Printer2
import com.socsi.smartposapi.printer.TextEntity

/** A module to utilize printer functionality. */
class PrinterModule {
    /** An instance of [Printer2] */
    private lateinit var printer: Printer2

    /** Method string of [havePrinter]. */
    public val havePrinterMethodString: String = "havePrinter"

    constructor(context: Context) {
        printer = Printer2.getInstance(context)
    }

    /** Check if printer is available. */
    fun havePrinter(): Boolean {
        var havePrinter = false
        try {
            havePrinter = printer.havePrinter()
        } catch (e: SDKException) {
            e.printStackTrace()
        }
        return havePrinter
    }
}