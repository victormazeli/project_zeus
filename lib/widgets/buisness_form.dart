// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../providers/authentication.dart';
// import 'package:provider/provider.dart';
// import '../providers/store.dart';

// class StoreForm extends StatefulWidget {
//   const StoreForm({
//     Key key,
//   }) : super(key: key);

//   @override
//   _StoreFormState createState() => _StoreFormState();
// }

// class _StoreFormState extends State<StoreForm> {
//   final _formkey = GlobalKey<FormState>();
//   final _pagekey = GlobalKey<ScaffoldState>();
//   TextEditingController _storenamecontroller;
//   TextEditingController _storetypecontroller;
//   TextEditingController _storeusercontroller;
//   TextEditingController _emailcontroller;
//   TextEditingController _passwordcontroller;
//   bool _isloading = false;

//   void showErrorScreen(BuildContext context, String message) {
//     setState(() {
//       _isloading = false;
//     });

//     showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               title: Text(message),
//               backgroundColor: Colors.white10,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               actions: <Widget>[
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('ok'),
//                   textColor: Colors.amber,
//                 )
//               ],
//             ));
//   }

//   @override
//   void initState() {
//     _storenamecontroller = TextEditingController(text: '');
//     _storetypecontroller = TextEditingController(text: '');
//     _storeusercontroller = TextEditingController(text: '');
//     _emailcontroller = TextEditingController(text: '');
//     _passwordcontroller = TextEditingController(text: '');
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _storenamecontroller.dispose();
//     _storetypecontroller.dispose();
//     _storeusercontroller.dispose();
//     _emailcontroller.dispose();
//     _passwordcontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formkey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Store Name'),
//                 controller: _storenamecontroller,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Enter Store Name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Store Type'),
//                 controller: _storetypecontroller,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Enter store type';
//                   }
//                   return null;
//                 },
//               ),
//               // Visibility(
//               //   child: TextFormField(
//               //     initialValue: "",
//               //     controller: _storeusercontroller,
//               //   ),
//               //   visible: false,
//               // ),
//               Container(
//                   margin: EdgeInsets.symmetric(vertical: 61.5),
//                   width: double.infinity,
//                   child: FlatButton(
//                     onPressed: () async {
//                       if (_formkey.currentState.validate()) {
//                         setState(() {
//                           _isloading = true;
//                         });
//                         try {
//                           final newstore = await Provider.of<StoreProduct>(
//                                   context,
//                                   listen: false)
//                               .createstore(
//                                   int.parse(_storeusercontroller.text),
//                                   _storenamecontroller.text,
//                                   _storetypecontroller.text);
//                           final token = await Provider.of<Auth>(context, listen: false)
//                                   .login(_emailcontroller.text,
//                                       _passwordcontroller.text);
//                           if (newstore != null && token !=null) {
//                             Navigator.pushReplacementNamed(
//                                 context, '/home-screen');
//                           }
//                         } catch (e) {
//                           setState(() {
//                             _isloading = false;
//                           });
//                           showErrorScreen(context, e.message);
//                           _pagekey.currentState.showSnackBar(
//                               SnackBar(content: Text('Could not register')));
//                         }
//                       }
//                     },
//                     child: Text(
//                       'CREATE STORE',
//                       style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 16,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     color: Theme.of(context).primaryColor,
//                     padding: EdgeInsets.all(14.0),
//                     textColor: Theme.of(context).accentColor,
//                   ))
//             ],
//           ),
//         ));
//   }
// }
