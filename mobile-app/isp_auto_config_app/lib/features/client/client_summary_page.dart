import 'package:flutter/material.dart';
import '../router/router_select_page.dart';

class ClientSummaryPage extends StatelessWidget {
  final String clientId;

  const ClientSummaryPage({
    super.key,
    required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cliente encontrado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text('ID do Cliente: $clientId'),
            const SizedBox(height: 8),
            const Text('Plano: 600 MB'),
            const SizedBox(height: 8),
            const Text('Tipo: Residencial'),
            const SizedBox(height: 8),
            const Text('PPPoE: disponível'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RouterSelectPage(),
                    ),
                  );
                },
                child: const Text('Selecionar Roteador'), // ✅ FALTAVA ISSO
              ),
            ),
          ],
        ),
      ),
    );
  }
}
