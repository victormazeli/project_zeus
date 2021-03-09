import 'package:flutter/material.dart';
import 'package:project_zeus/providers/authentication.dart';
import 'package:provider/provider.dart';
import '../widgets/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/register-form';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('CREATE STORE'), backgroundColor: Theme.of(context).primaryColor,),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Provider(
          create: (context) => Auth(),
          child: RegistrationForm()
          ),
        ),
      );
  }
}

