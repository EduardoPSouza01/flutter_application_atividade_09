import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_09/classes/disciplina.dart';
import 'package:flutter_application_atividade_09/widgets/disciplina_card.dart';

class Aula09Disciplinas extends StatelessWidget {
  Aula09Disciplinas({super.key});

  final List<Disciplina> disciplina = Disciplina.gerarDisciplina();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: disciplina.length,
      itemBuilder: (context, index) {
        return DisciplinaCard(disciplina: disciplina[index]);
      },
    );
  }
}
