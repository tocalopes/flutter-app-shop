import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';

class OrdersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Meus pedidos'),
        
      ),
    );
  }
}