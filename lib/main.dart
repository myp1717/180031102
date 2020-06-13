import 'package:flutter/material.dart';
import 'product_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Martin Food Shop',
      home: new ProductList(),
    );
  }
}
