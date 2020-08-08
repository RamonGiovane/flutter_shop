
import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {
  
  List<Product> _items = DUMMY_PRODUCTS;

  //Retornando uma copia da lista original para que nao se perca a ref da lista original
  List<Product> get items => [... _items];


  void addProduct(Product product){
    _items.add(product);
    notifyListeners(); //Notifica aos ouvintes a inserção de um novo produto.
  }
}