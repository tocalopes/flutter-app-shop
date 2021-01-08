import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders_providers.dart';

class OrderItemWidget extends StatefulWidget {
  @override
  final Order order;

  OrderItemWidget(this.order);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final Order order = widget.order;
    print(_expanded);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'R\$ ${order.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yy - hh:mm').format(widget.order.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          _expanded == false
              ? Container()
              : Container(
                  height: MediaQuery.of(context).size.height *
                      order.products.length *
                      0.1,
                  child: ListView.builder(
                    itemCount: order.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Text((order.products[index].price *
                                order.products[index].quantity)
                            .toStringAsFixed(2)),
                        title: Text(order.products[index].title),
                        subtitle: Text(
                            '${order.products[index].quantity.toString()} X ${order.products[index].price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
