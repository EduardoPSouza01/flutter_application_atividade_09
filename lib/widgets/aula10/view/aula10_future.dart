import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var _carregador = true;

  void simuladorCarregador() async {
    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      _carregador = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    simuladorCarregador();
    return Scaffold(
      body: Center(
        child:
            _carregador
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Carregando...'),
                    SizedBox(height: 8),
                    CircularProgressIndicator(),
                  ],
                )
                : const Text("Bem vindo(a)!"),
      ),
    );
  }
}
