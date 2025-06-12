import 'package:flutter/material.dart';

class _Aula10State extends State<Aula10> {
  void nomeFuncao() async {
    await Future.delayed(const Duration(seconds: 10));
    debugPrint('Esta linha sera execultado apos 10 segudos');
  }

  @override
  Widget build(BuildContext context) {
    nomeFuncao();
    return const Placeholder();
  }
}
