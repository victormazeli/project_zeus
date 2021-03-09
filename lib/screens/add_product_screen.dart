import 'package:flutter/material.dart';
import 'package:project_zeus/widgets/add_product.dart';


class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD PRODUCTS'),),
      body: AddProduct(),
    );
  }
}
