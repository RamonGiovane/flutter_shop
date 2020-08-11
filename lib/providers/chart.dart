import 'dart:math';

import 'package:flutter/foundation.dart';

import 'models/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  const CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items => {..._items};

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) {
          return CartItem(
            id: existingItem.id,
            price: existingItem.price,
            quantity: existingItem.quantity + 1,
            title: existingItem.title,
          );
        },
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          price: product.price,
          quantity: 1,
          title: product.title,
        ),
      );
    }
    notifyListeners();
  }
}
