import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;
    return ClipRRect( //Make component Rounded
    borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            color: accentColor,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}