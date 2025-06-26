import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_09/aula12/model/carrinho_model.dart';
import 'package:flutter_application_atividade_09/aula12/view/pedido_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_atividade_09/aula12/model/produto.dart';

class CardapioView extends StatelessWidget {
  const CardapioView({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                if (carrinho.numProdutos > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PedidoView()),
                  );
                }
              },
              child: Badge(
                label: Text('${carrinho.numProdutos}'),
                isLabelVisible: carrinho.numProdutos > 0,
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Produto.gerarLista().length,
        itemBuilder: (context, index) {
          var produto = Produto.gerarLista()[index];
          return ListTile(
            title: Text(produto.nome),
            subtitle: Text(produto.preco.toStringAsFixed(2)),
            trailing:
                carrinho.adicionado(produto)
                    ? IconButton(
                      onPressed: () {
                        carrinho.remover(produto);
                      },
                      icon: const Icon(Icons.remove),
                    )
                    : IconButton(
                      onPressed: () {
                        carrinho.adicionar(produto);
                      },
                      icon: const Icon(Icons.add),
                    ),
          );
        },
      ),
    );
  }
}
