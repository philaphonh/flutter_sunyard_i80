import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_sunyard_i80/flutter_sunyard_i80.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPrinterAvailable = false;

  String serialNumber = "";

  @override
  void initState() {
    super.initState();
    initPage();
  }

  void initPage() async {
    final isTrue = await Printer.isPrinterAvailable();
    serialNumber = await TerminalInfo.serialNumber;
    if (isTrue) {
      setState(() {
        isPrinterAvailable = isTrue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_sunyard_i80 Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Printer Serial Number: $serialNumber'),
              ),
              Center(
                child: Text('Printer status: ${printerStatus()}'),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        printText();
                      },
                      child: const Text('Print Text')),
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        printImage();
                      },
                      child: const Text('Print Image')),
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        printBarcode();
                      },
                      child: const Text('Print Barcode')),
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        printQr();
                      },
                      child: const Text('Print QR')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String printerStatus() {
    return isPrinterAvailable ? "Available" : "Unavailable";
  }

  void printText() async {
    try {
      await Printer.appendText(
        text: "Flutter",
        textAlign: PrinterAlign.left,
      );

      await Printer.appendText(
        text: "Flutter",
        textAlign: PrinterAlign.right,
      );

      await Printer.appendText(
        text: "Flutter",
        textAlign: PrinterAlign.left,
        isBoldFont: true,
      );
      await Printer.appendText(
        text: "Flutter",
        textAlign: PrinterAlign.right,
        isLineBreak: false,
        fontSize: PrinterFontSize.thirtySix,
      );

      await Printer.startPrint();
    } catch (e) {
      rethrow;
    }
  }

  void printImage() async {
    // An image must have white background
    final assetImage = await rootBundle.load("assets/wojak.jpg");

    final bytes = Uint8List.view(assetImage.buffer);

    await Printer.appendImage(
      byteArray: bytes,
      align: PrinterAlign.right,
    );

    await Printer.appendImage(
      byteArray: bytes,
      align: PrinterAlign.left,
      sampleSize: 2,
    );

    await Printer.startPrint();
  }

  void printBarcode() async {
    await Printer.appendBarCode(data: "1234567890");

    await Printer.startPrint();
  }

  void printQr() async {
    await Printer.appendQrCode(
      data: "https://artyboy.dev",
      width: 100,
      height: 100,
    );

    await Printer.startPrint();
  }
}
