import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/product_model.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<ProductModel> loadedProducts = DUMMY_PRODUCTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('minha loja'),
        ),
        body: GridView.builder(
          itemCount: loadedProducts.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (context, index) => Text(loadedProducts[index].title),
        ));
  }
}
