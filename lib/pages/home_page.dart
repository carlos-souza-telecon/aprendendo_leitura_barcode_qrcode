import 'package:aprendendo_leitura_barcode_qrcode/pages/scanner_page.dart';
import 'package:aprendendo_leitura_barcode_qrcode/utils/nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _resultadoLeitura = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aprendendo Leitura Barcode')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            const Text('Clique no botão abaixo para fazer a leitura'),
            const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () async {
                var resultadoLeitura = await push(context, const ScannerPage());
                setState(() {
                  if (resultadoLeitura == null) {
                    _resultadoLeitura = 'Nenhum código encontrado';
                  } else {
                    _resultadoLeitura = resultadoLeitura;
                  }
                });
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('LER CÓDIGO'),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Resultado da leitura: $_resultadoLeitura',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
