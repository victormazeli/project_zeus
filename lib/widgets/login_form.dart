import 'package:flutter/material.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import '../providers/authentication.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _pagekey = GlobalKey<ScaffoldState>();
  TextEditingController _emailcontroller;
  TextEditingController _passwordcontroller;
  bool _isloading = false;

  void showErrorScreen(BuildContext context, String message) {
    setState(() {
      _isloading = false;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(message),
              backgroundColor: Colors.white10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'),
                  textColor: Colors.amber,
                )
              ],
            ));
  }

  @override
  void initState() {
    _emailcontroller = TextEditingController(text: '');
    _passwordcontroller = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Enter your Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 44.5),
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        setState(() {
                          _isloading = true;
                        });
                        try {
                          final token =
                              await Provider.of<Auth>(context, listen: false)
                                  .login(_emailcontroller.text,
                                      _passwordcontroller.text);
                          if (token != null) {
                            sharedPrefs.token = token;
                            Navigator.pushReplacementNamed(
                                context, '/home-screen');
                          }
                        } catch (e) {
                          setState(() {
                            _isloading = false;
                          });
                          showErrorScreen(context, e.message);
                          _pagekey.currentState.showSnackBar(
                              SnackBar(content: Text('Could not login')));
                        }
                      }
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(14.0),
                    textColor: Theme.of(context).accentColor,
                  ))
            ],
          ),
        ));
  }
}
