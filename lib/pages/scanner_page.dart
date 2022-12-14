import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leitura de código')),
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          Navigator.pop(context, barcode.rawValue);
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
