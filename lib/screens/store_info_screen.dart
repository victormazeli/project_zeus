import 'package:flutter/material.dart';
import 'package:project_zeus/models/store.dart';
import 'package:project_zeus/widgets/store_detail.dart';

class StoreDetailScreen extends StatelessWidget {
  static const routeName = '/store-detail';
  @override
  Widget build(BuildContext context) {
    final Store store = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('STORE DETAIL'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 100),
          padding: EdgeInsets.all(15.0),
          child: BuisnessDetailForm(store: store)),
    );
  }
}
