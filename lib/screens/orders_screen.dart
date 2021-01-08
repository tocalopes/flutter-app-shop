import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_item_widget.dart';
import 'package:shop/providers/orders_providers.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Meus pedidos'),
        ),
        body: ListView.builder(
          itemCount: orders.itemsCount,
          itemBuilder: (context,index) {
            return OrderItemWidget(orders.items[index]);
          },
        ));
  }
}
