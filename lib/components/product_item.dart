import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/product_model.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductModel product = Provider.of<ProductModel>(
      context,
      listen: false,
    );
    final Cart cart = Provider.of<Cart>(context, listen: false);
    Color accentColor = Theme.of(context).accentColor;
    return ClipRRect(
      //Make component Rounded
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<ProductModel>(
              //child: Text('Nunca Muda'),
              builder: (ctx, product, _ /*child*/) => IconButton(
                color: accentColor,
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toogleFavorite();
                },
              ),
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
              onPressed: () {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Produto ${product.title} adicionado ao carrinho',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: 'Desfazer',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        }),
                  ),
                );
                cart.addItem(product);
              },
            ),
          ),
        ),
      ),
    );
  }
}
