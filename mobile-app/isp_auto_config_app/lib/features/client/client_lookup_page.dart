import 'package:flutter/material.dart';
import 'client_summary_page.dart';

class ClientLookupPage extends StatefulWidget {
  const ClientLookupPage({super.key});

  @override
  State<ClientLookupPage> createState() => _ClientLookupPageState();
}

class _ClientLookupPageState extends State<ClientLookupPage> {
  final _clientIdController = TextEditingController();
  bool _loading = false;

  Future<void> _buscarCliente() async {
    if (_clientIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o ID do cliente')),
      );
      return;
    }

    setState(() => _loading = true);

    // SIMULA chamada ao sistema do ISP
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    // NAVEGA PARA O RESUMO DO CLIENTE
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ClientSummaryPage(
          clientId: _clientIdController.text,
        ),
      ),
    );
  } // 👈 FECHAMENTO QUE ESTAVA FALTANDO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _clientIdController,
              decoration: const InputDecoration(
                labelText: 'ID do Cliente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _buscarCliente,
                    child: const Text('Buscar'),
                  ),
          ],
        ),
      ),
    );
  }
}
