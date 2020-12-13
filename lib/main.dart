import 'package:flutter/material.dart';
import 'package:shop/screens/produtc_detail._screen.dart';
import 'package:shop/utils/app_routes.dart';

import 'screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
      routes: {
        AppRoutes.PRODUCT_DETAIL : (ctx) => ProductDetailScreen();
      },
    );
  }
}