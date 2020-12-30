import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/product_model.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  double get totalAmount{
   //var total = _items.entries.fold(0.0,(value, element) => element.value.price * element.value.quantity);
   var total = 0.0;
   _items.forEach((key, value) { 
     total += value.price * value.quantity;
   });
   return total;
  }

  void addItem(ProductModel product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
            id: Random().nextDouble().toString(),
            title: product.title,
            quantity: 1,
            price: product.price),
      );
    }
    notifyListeners();
  }
}
