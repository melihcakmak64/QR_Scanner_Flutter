import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/ResultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "Scanner Result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Code Scanner"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageContainer,
          scanButton,
        ],
      ),
    );
  }

  void scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', "Cancel", true, ScanMode.DEFAULT);
      if (!mounted) return;
      setState(() {
        if (qrCode != "-1")
          result = qrCode;
        else {
          result = "Please try again!";
        }
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultPage(result: result),
        ));
      });
    } on PlatformException {
      setState(() {
        result = "Failed to scan QR Code";
      });
    }
  }

  Container get imageContainer => Container(
        height: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/scan_me.jpg"))),
      );

  ElevatedButton get scanButton => ElevatedButton(
        onPressed: () {
          scanQR();
        },
        child: const Text("Scan"),
      );
}
