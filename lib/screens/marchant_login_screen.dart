import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class MarchantScreen extends StatelessWidget {
  static const routeName = '/marchant-login';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN'), backgroundColor: Theme.of(context).primaryColor,),
      body: Padding(
        padding: EdgeInsets.all(15.0),
         child: Container(
           margin: EdgeInsets.symmetric(vertical: 100),
           child: LoginForm()
           )
           ,),
      );
  }
}

