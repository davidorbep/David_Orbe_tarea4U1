import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConvertidorBinario(),
    );
  }
}

class ConvertidorBinario extends StatefulWidget {
  @override
  _ConvertidorBinarioState createState() => _ConvertidorBinarioState();
}

class _ConvertidorBinarioState extends State<ConvertidorBinario> {
  final TextEditingController _controller = TextEditingController();
  String resultado = "";

  void convertirABinario() {
    if (_controller.text.isEmpty) return;

    int decimal = int.parse(_controller.text);
    setState(() {
      resultado = decimal.toRadixString(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertidor Decimal a Binario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese un número decimal",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertirABinario,
              child: const Text("Convertir"),
            ),
            const SizedBox(height: 20),
            Text(
              "Resultado en binario: $resultado",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
