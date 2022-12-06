import 'package:aprendendo_leitura_barcode_qrcode/pages/scanner_page.dart';
import 'package:aprendendo_leitura_barcode_qrcode/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      appBar: AppBar(title: Text('Aprendendo Leitura Barcode')),
      body: Center(
        child: Column(
          children: [
            Text(
                'Clique no botão abaixo para ler um código de barras ou QRCode'),
            ElevatedButton.icon(
              onPressed: () async {
                var resultadoLeitura = await push(context, ScannerPage());
                setState(() {
                  if (resultadoLeitura == null) {
                    _resultadoLeitura = 'Nenhum código encontrado';
                  } else {
                    _resultadoLeitura = resultadoLeitura;
                  }
                });
              },
              icon: Icon(Icons.qr_code_scanner),
              label: Text('LER CÓDIGO'),
            ),
            Text('Resultado da leitura: ${_resultadoLeitura}'),
          ],
        ),
      ),
    );
  }
}
