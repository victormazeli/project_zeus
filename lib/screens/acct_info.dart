import 'package:flutter/material.dart';
import '../widgets/acct_info_form.dart';

class AccountInfo extends StatelessWidget {
  static const routeName = '/acct-info';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account'),),
      body: Padding(
        padding: EdgeInsets.only(left:15, right: 15), 
        child: AccountInfoForm(),),
    );
  }
}