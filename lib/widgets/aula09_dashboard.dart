import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_atividade_09/classes/disciplina.dart';

class Aula09Dashboard extends StatelessWidget {
  const Aula09Dashboard({super.key, required this.usuario});

  final String usuario;

  @override
  Widget build(BuildContext context) {
    final disciplinas = Disciplina.gerarDisciplina();
    final random = Random();
    final sugestao = disciplinas[random.nextInt(disciplinas.length)];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem-vindo, $usuario!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text(
            'Sugestão de disciplina para estudar:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 12),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(sugestao.nome, style: TextStyle(fontSize: 18)),
                  Text('Professor: ${sugestao.professor}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
