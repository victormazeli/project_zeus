import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_zeus/models/store.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';
import '../utility/shared_prefs.dart';
import 'package:image_picker/image_picker.dart';

class BuisnessDetailForm extends StatefulWidget {
  final Store store;

  BuisnessDetailForm({this.store});

  @override
  _BuisnessDetailFormState createState() => _BuisnessDetailFormState();
}

class _BuisnessDetailFormState extends State<BuisnessDetailForm> {
  final _formkey = GlobalKey<FormState>();
  final _pagekey = GlobalKey<ScaffoldState>();
  TextEditingController _storenamecontroller;
  TextEditingController _phonecontroller;
  TextEditingController _addresscontroller;
  TextEditingController _statecontroller;
  TextEditingController _citycontroller;
  TextEditingController _logocontroller;
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
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
            )
            );
  }

  _imgFromGallery() async {
    final pickedfile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 300);

    setState(() {
      _imageFile = pickedfile;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          // after put safe area here for IoS
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _storenamecontroller = TextEditingController(text: '');
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70.5,
            ),
            TextFormField(
              initialValue: widget.store.storename,
              decoration: InputDecoration(
                labelText: 'Store Name',
              ),
            ),
            TextFormField(
              initialValue: widget.store.address,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              initialValue: widget.store.phoneno.toString(),
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              initialValue: widget.store.state,
              decoration: InputDecoration(
                labelText: 'State',
              ),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              initialValue: widget.store.city,
              decoration: InputDecoration(
                labelText: 'City',
              ),
              keyboardType: TextInputType.text,
            ),
            // TextFormField(decoration: InputDecoration(labelText: 'Password',), keyboardType: TextInputType.text,),
            // TextFormField(decoration: InputDecoration(labelText: 'Confirm Password',), keyboardType: TextInputType.text,),

            GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: Center(
                  child: _imageFile != null
                      ? ClipRect(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              widthFactor: 0.6,
                              heightFactor: 1.0,
                              child: Image.file(File(_imageFile.path)),
                            ),
                          ),
                        )
                      : Container(
                          width: 300,
                          height: 300,
                          margin: EdgeInsets.only(top: 13),
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 0.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Icon(
                                Icons.cloud_upload,
                                color: Colors.grey,
                              ),
                              Center(
                                  child: Text(
                                'Click to Choose file',
                                style: TextStyle(color: Colors.grey),
                              ))
                            ],
                          ))),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 125),
                child: FlatButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() {
                        _isloading = true;
                      });
                      try {
                        final newstore = await Provider.of<StoreProduct>(
                                context,
                                listen: false)
                            .updatetore(
                          sharedPrefs.userid,
                          _storenamecontroller.text,
                          int.parse(_phonecontroller.text),
                          _addresscontroller.text,
                          _citycontroller.text,
                          _statecontroller.text,
                          File('${widget.store.logo}'),
                          widget.store.id,
                        );

                        if (newstore != null) {
                          Navigator.pushReplacementNamed(
                              context, '/profile-screen');
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
                    'SAVE',
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).accentColor,
                ))
          ],
        ),
      ),
    );
  }
}
