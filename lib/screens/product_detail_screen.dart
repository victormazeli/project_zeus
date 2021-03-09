import 'package:flutter/material.dart';
import 'package:project_zeus/widgets/product_detail.dart';
import 'package:project_zeus/models/product.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product_screen';
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCT DETAIL'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                Provider.of<StoreProduct>(context).deleteproduct(product.id);
                Navigator.pop(context);
              })
        ],
      ),
      body: ProductDetail(
        product: product,
      ),
    );
  }
}
