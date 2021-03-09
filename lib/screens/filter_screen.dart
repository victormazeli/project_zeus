import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FILTER'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('Category'),
              initiallyExpanded: false,
              children: <Widget>[
                CheckboxListTile(
                  value: true,
                  onChanged: (value) {},
                  title: Text('Check list'),
                )
              ],
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Apply'),
              textColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
