import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders_providers.dart';

class OrderItemWidget extends StatelessWidget {
  @override

  final Order order;

  OrderItemWidget(this.order);
  
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('R\$ ${order.total}'),
        subtitle: Text(
          DateFormat('dd/MM/yy - hh:mm').format(order.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.expand_more),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}