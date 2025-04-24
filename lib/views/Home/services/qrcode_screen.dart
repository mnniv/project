import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({super.key});

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  String _scanResult = "Scan a QR code"; // Variable to hold the scan result

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      
      if (barcodeScanRes != '-1') {
        setState(() {
          _scanResult = barcodeScanRes; 
        });
      } else {
        setState(() {
          _scanResult = "Scan cancelled"; 
        });
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
      setState(() {
        _scanResult = barcodeScanRes; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: scanQR,
                
                textColor: Theme.of(context).primaryColor, 
                child: const Text(
                  'Scan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               SizedBox(height: 20), // Add some space
              Text(
                _scanResult,
                style:  TextStyle(
                 color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

