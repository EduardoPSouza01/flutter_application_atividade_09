import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_09/aula12/model/carrinho_model.dart';
import 'package:provider/provider.dart';

class PedidoView extends StatelessWidget {
  const PedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoModel>();
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: carrinho.numProdutos,
            itemBuilder: (context, index) { return Padding(padding: padding)},
          ),
        ],
      ),
    );
  }
}
