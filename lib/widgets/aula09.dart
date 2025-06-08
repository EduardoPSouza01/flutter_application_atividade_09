import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_09/widgets/aula09_dashboard.dart';
import 'package:flutter_application_atividade_09/widgets/aula09_disciplinas.dart';
import 'package:go_router/go_router.dart';

class Aula09 extends StatefulWidget {
  final String usuario;

  const Aula09({super.key, required this.usuario});

  @override
  State<Aula09> createState() => _Aula09State();
}

class _Aula09State extends State<Aula09> {
  int _itemSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    //String nomeUsuario = args['usuario'] ?? 'Usuário';

    final List<Widget> _subtelas = [
      Aula09Dashboard(usuario: widget.usuario),
      Aula09Disciplinas(),
    ];

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {},
      child: Scaffold(
        body: Center(child: _subtelas[_itemSelecionado]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(Icons.home),
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              label: 'Disciplinas',
              icon: Icon(Icons.menu_open),
            ),
            BottomNavigationBarItem(label: 'Sair', icon: Icon(Icons.logout)),
          ],
          currentIndex: _itemSelecionado,
          onTap: (idx) {
            setState(() {
              if (idx == 2) {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('Sair'),
                        content: Text('Deseja realmente sair?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.go('/');
                            },
                            child: Text('Sair'),
                          ),
                        ],
                      ),
                );
              } else {
                setState(() {
                  _itemSelecionado = idx;
                });
              }
            });
          },
        ),
      ),
    );
  }
}
