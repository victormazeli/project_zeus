import 'package:flutter/material.dart';

class AccountInfoForm extends StatefulWidget {
  @override
  _AccountInfoFormState createState() => _AccountInfoFormState();
}

class _AccountInfoFormState extends State<AccountInfoForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.5,),
            TextFormField(decoration: InputDecoration(labelText: 'Email Address',), keyboardType: TextInputType.emailAddress,),
            TextFormField(decoration: InputDecoration(labelText: 'Password',), keyboardType: TextInputType.text,),
            TextFormField(decoration: InputDecoration(labelText: 'Confirm Password',), keyboardType: TextInputType.text,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top:125),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () {}, 
              child: Text('SAVE', 
              style: TextStyle(
                fontFamily: 'Segoe UI', 
                fontSize: 16, 
                fontStyle: FontStyle.normal, 
                fontWeight: FontWeight.w600),), 
                color: Theme.of(context).primaryColor, 
                textColor: Theme.of(context).accentColor, )
                )
          ],),
      ),
      
    );
  }
}