import 'package:flutter/material.dart';

class RouterSelectPage extends StatefulWidget {
  const RouterSelectPage({super.key});

  @override
  State<RouterSelectPage> createState() => _RouterSelectPageState();
}

class _RouterSelectPageState extends State<RouterSelectPage> {
  String? _fabricante;
  String? _modelo;

  final Map<String, List<String>> _modelosPorFabricante = {
    'Huawei': ['ONT HG8145', 'ONT EG8145'],
    'Nokia': ['ONT G-140W', 'ONT G-1425G'],
    'Intelbras': ['AC 1200', 'AX 3000'],
    'TP-Link': ['Archer C6', 'Archer AX10'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar Equipamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Fabricante',
                border: OutlineInputBorder(),
              ),
              value: _fabricante,
              items: _modelosPorFabricante.keys
                  .map(
                    (fab) => DropdownMenuItem(
                      value: fab,
                      child: Text(fab),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fabricante = value;
                  _modelo = null;
                });
              },
            ),
            const SizedBox(height: 16),
            if (_fabricante != null)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
                value: _modelo,
                items: _modelosPorFabricante[_fabricante]!
                    .map(
                      (mod) => DropdownMenuItem(
                        value: mod,
                        child: Text(mod),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _modelo = value;
                  });
                },
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _fabricante != null && _modelo != null
                    ? () {
                        // próximo passo do fluxo
                      }
                    : null,
                child: const Text('Continuar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
