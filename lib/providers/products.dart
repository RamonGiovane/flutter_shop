import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  bool _showFavoriteOnly = false;

  //Retornando uma copia da lista original para que nao se perca a ref da lista original
  List<Product> get items => _showFavoriteOnly
      ? _items.where((i) => i.isFavorite).toList()
      : [..._items];


  void showFavoriteOnly(){
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll(){
     _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //Notifica aos ouvintes a inserção de um novo produto.
  }
}
