import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _items = DUMMY_PRODUCTS;

  List<ProductModel> get items => [..._items];
  List<ProductModel> get favoriteItems {
    return items.where((prd) => prd.isFavorite).toList();
  } 

  void addProduct(ProductModel product) {
    _items.add(product);
    notifyListeners();
  }
  // void showFavoriteOnly(){
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  //bool _showFavoriteOnly = false;

}
