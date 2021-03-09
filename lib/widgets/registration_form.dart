import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import '../providers/authentication.dart';
import '../providers/store.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({
    Key key,
  }) : super(key: key);

  @override
  _RegistrationForm createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  final _formkey = GlobalKey<FormState>();
  final _pagekey = GlobalKey<ScaffoldState>();
  TextEditingController _emailcontroller;
  TextEditingController _passwordcontroller;
  TextEditingController _confirmpasswordcontroller;
  TextEditingController _storenamecontroller;
  TextEditingController _phonecontroller;
  TextEditingController _addresscontroller;
  TextEditingController _statecontroller;
  TextEditingController _citycontroller;
  TextEditingController _logocontroller;
  bool _isloading = false;

//   _imgFromGallery() async {
//   File image = await  ImagePicker.pickImage(
//       source: ImageSource.gallery, imageQuality: 50
//   );

//   setState(() {
//     _image = image;
//   });
// }

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

//   void _showPicker(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         // after put safe area here for IoS
//         return  Container(
//             child:  Wrap(
//               children: <Widget>[
//                    ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text('Photo Library'),
//                     onTap: () {
//                       _imgFromGallery();
//                       Navigator.of(context).pop();
//                     }),
//               ],
//             ),
//           );
//       }
//     );
// }

  @override
  void initState() {
    _storenamecontroller = TextEditingController(text: '');
    _emailcontroller = TextEditingController(text: '');
    _passwordcontroller = TextEditingController(text: '');
    _confirmpasswordcontroller = TextEditingController(text: '');
    _addresscontroller = TextEditingController(text: '');
    _citycontroller = TextEditingController(text: '');
    _logocontroller = TextEditingController(text: '');
    _statecontroller = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _storenamecontroller.dispose();
    _statecontroller.dispose();
    _addresscontroller.dispose();
    _citycontroller.dispose();
    _phonecontroller.dispose();
    _logocontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
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
              //        SizedBox(
              //         height: 32,
              //     ),
              //     Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       _showPicker(context);
              //     },
              //     child: CircleAvatar(
              //       radius: 55,
              //       backgroundColor: Color(0xffFDCF09),
              //       child: _image != null
              //           ? ClipRRect(
              //               borderRadius: BorderRadius.circular(50),
              //               child: Image.file(
              //                 _image,
              //                 width: 100,
              //                 height: 100,
              //                 fit: BoxFit.fitHeight,
              //               ),
              //             )
              //           : Container(
              //               decoration: BoxDecoration(
              //                   color: Colors.grey[200],
              //                   borderRadius: BorderRadius.circular(50)),
              //               width: 100,
              //               height: 100,
              //               child: Icon(
              //                 Icons.camera_alt,
              //                 color: Colors.grey[800],
              //               ),
              //             ),
              //     ),
              //   ),
              // ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Store Name'),
                controller: _storenamecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Store Name';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(labelText: 'Mobile No'),
              //   controller: _phonecontroller,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Enter Mobile No';
              //     }
              //     return null;
              //   },
              // ),

              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(labelText: 'Address'),
              //   controller: _phonecontroller,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Enter Address';
              //     }
              //     return null;
              //   },
              // ),

              //  TextFormField(
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(labelText: 'State'),
              //   controller: _phonecontroller,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Enter State';
              //     }
              //     return null;
              //   },
              // ),

              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(labelText: 'City'),
              //   controller: _phonecontroller,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Enter City';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Address'),
                controller: _emailcontroller,
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
                controller: _passwordcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                controller: _confirmpasswordcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please confirm password';
                  } else if (value.contains(_passwordcontroller.text)) {
                    return 'Password not the same ';
                  }
                  return null;
                },
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 61.5),
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        setState(() {
                          _isloading = true;
                        });
                        try {
                          final newuser =
                              await Provider.of<Auth>(context, listen: false)
                                  .register(_emailcontroller.text,
                                      _passwordcontroller.text);
                          final newstore = await Provider.of<StoreProduct>(
                                  context,
                                  listen: false)
                              .createstore(
                            newuser.id,
                            _storenamecontroller.text,
                          );
                          final newdomain = await Provider.of<StoreProduct>(
                                  context,
                                  listen: false)
                              .createdomain(
                                  _storenamecontroller.text, newstore.id);
                          final token =
                              await Provider.of<Auth>(context, listen: false)
                                  .login(_emailcontroller.text,
                                      _passwordcontroller.text);
                          if (newuser != null &&
                              token != null &&
                              newstore != null &&
                              newdomain != null) {
                            sharedPrefs.userid = newuser.id;
                            sharedPrefs.storeid = newstore.id;
                            sharedPrefs.token = token.auth_token;
                            sharedPrefs.domainurl = newdomain.domain;
                            Navigator.pushReplacementNamed(
                                context, '/home-screen');
                          }
                        } catch (e) {
                          setState(() {
                            _isloading = false;
                          });
                          showErrorScreen(context, e.message);
                          _pagekey.currentState.showSnackBar(
                              SnackBar(content: Text('Could not register')));
                        }
                      }
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(14.0),
                    textColor: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ))
            ],
          ),
        ));
  }
}
