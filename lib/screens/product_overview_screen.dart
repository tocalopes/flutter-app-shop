import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import '../data/dummy_data.dart';
import '../models/product_model.dart';
import '../components/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> loadedProducts = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
        appBar: AppBar(
          title: Text('minha loja'),
        ),
        body: GridView.builder(
          itemCount: loadedProducts.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => ProductItem(loadedProducts[index]),
        ));
  }
}
