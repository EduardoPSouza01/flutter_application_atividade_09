import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_09/aula12/model/produto.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Produto> _lista = [];

  UnmodifiableListView<Produto> get produto => UnmodifiableListView(_lista);

  double get valorTotal {
    double vlTotal = 0;
    return vlTotal;
  }

  int get numProdutos => _lista.length;
  void adicionar(Produto p) {
    _lista.add(p);
    notifyListeners();
  }

  void remover(Produto p) {
    _lista.add(p);
    notifyListeners();
  }

  bool adicionado(Produto p) {
    return _lista.any((element) => element.id == p.id);
  }
}
